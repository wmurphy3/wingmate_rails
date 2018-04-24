class Api::V1::LeaguesController < Api::V1::ApplicationController
  before_action :set_league, only: [:show, :update, :destroy]

  def index
    @leagues = League.joins(:league_users).where(league_users: {user_id: current_user.id}).active
    render json: @leagues, each_serializer: LeagueSerializer, scope: current_user
  end

  def show
    render json: @league, serializer: LeaderboardSerializer
  end

  def pending
    @leagues = League.joins(:league_users).where(league_users: {user_id: current_user.id}).pending
    render json: @leagues, each_serializer: LeagueSerializer, scope: current_user
  end

  def create
    @form = League::Form.from_params(league_params)

    League::Create.call(@form, current_user) do
      on(:ok) do |league|
        render({
          :json       => league,
          :status     => :created,
          :serializer => LeaderboardSerializer
        })
      end
      on(:invalid) do |errors|
        render json: { errors: errors }, status: :unprocessable_entity
      end
    end
  end

  def update
    @form = League::Form.from_params(league_params)

    League::Update.call(@form, @league, current_user) do
      on(:ok) do |league|
        render({
          :json       => league,
          :status     => :created,
          :serializer => LeagueSerializer
        })
      end
      on(:invalid) do |errors|
        render json: { errors: errors }, status: :unprocessable_entity
      end
    end
  end

  def destroy
    if @league.destroy
      render json: '', status: :no_content
    else
      render json: { errors: @league.errors }, status: :unprocessable_entity
    end
  end

  private

  def league_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end

  def set_league
    @league = League.find(params[:id])
  end
end
