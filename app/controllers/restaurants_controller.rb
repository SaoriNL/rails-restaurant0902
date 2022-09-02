class RestaurantsController < ApplicationController
  before_action :set_category, only: %i[new create]
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.category = @category
    @restaurant.save ? (redirect_to category_path(@category)) : (render :new)
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address)
  end
end
