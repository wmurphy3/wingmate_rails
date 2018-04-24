class Api::V1::UserAchievementsController < Api::V1::ApplicationController

  def show
    @achievements = UserAchievement.where(league_id: params[:id]).recent
    render json: @achievements, each_serializer: UserAchievementSerializer
  end

end
