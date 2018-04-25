class CategoriesController < ApplicationController
  before_action :redirect_unless_admin
  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.page(params[:page])
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    if Category.create(update_params)
      flash[:notice] = 'Category was successfully updated.'
      redirect_to categories_path
    else
      flash[:error] = "Category not created"
      render :new
    end
  end

  def update
    if @category.update(update_params)
      flash[:notice] = 'Category was successfully updated.'
      redirect_to categories_path
    else
      flash[:error] = @category.errors.full_messages
      render :edit
    end
  end

  def destroy
    @category.destroy
    flash[:notice] = 'category was successfully destroy.'
    redirect_to categories_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def update_params
    params.require(:category).permit(:name)
  end

  def redirect_unless_admin
    unless current_user.is_admin?
      redirect_to root_path
    end
  end

end
