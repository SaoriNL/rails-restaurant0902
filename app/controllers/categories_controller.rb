class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @restaurants = Restaurant.where(category_id: @category.id)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to category_path(@category)
  end

  def destroy
    @category = Category.find(params[:id])
    @category.delete
    redirect_to categories_path
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
