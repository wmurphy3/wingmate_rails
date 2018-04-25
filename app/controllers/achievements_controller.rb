class AchievementsController < ApplicationController
  before_action :redirect_unless_admin
  before_action :set_achievement, only: [:edit, :update, :destroy]

  def index
    @achievements = Achievement.page(params[:page])
  end

  def new
    @achievement = Achievement.new
  end

  def edit
  end

  def create
    if Achievement.create(update_params)
      flash[:notice] = 'Achievement was successfully updated.'
      redirect_to achievements_path
    else
      flash[:error] = "Achievement not created"
      render :new
    end
  end

  def update
    if @achievement.update(update_params)
      flash[:notice] = 'Achievement was successfully updated.'
      redirect_to achievements_path
    else
      flash[:error] = @achievement.errors.full_messages
      render :edit
    end
  end

  def destroy
    @achievement.destroy
    flash[:notice] = 'Achievement was successfully destroy.'
    redirect_to achievements_path
  end

  private

  def set_achievement
    @achievement = Achievement.find(params[:id])
  end

  def update_params
    params.require(:achievement).permit(:name, :points, :category_id)
  end

  def redirect_unless_admin
    unless current_user.is_admin?
      redirect_to root_path
    end
  end

end
