class Api::V1::CategoriesController < Api::V1::ApplicationController

  def show
    @categories = Category.all
    render json: @categories, each_serializer: CategorySerializer
  end
end
