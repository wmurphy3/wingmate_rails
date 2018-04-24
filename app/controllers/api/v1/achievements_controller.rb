class Api::V1::AchievementsController < Api::V1::ApplicationController

  def show
    @achievements = Achievement.where(category_id: params[:id])
    render json: @achievements, each_serializer: AchievementSerializer
  end
  
end
