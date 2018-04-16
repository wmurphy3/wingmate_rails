class Api::V1::LeaguesController < Api::V1::ApplicationController
  def index
    @leagues = League.joins(:league_users).where(league_users: {user_id: current_user.id})
    render json: @leagues, each_serializer: LeagueSerializer, scope: current_user
  end

  def show
    @league = League.find(params[:id])
    render json: @league, serializer: LeaderboardSerializer
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
  end

  def destroy
  end

  private

  def league_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end
end
