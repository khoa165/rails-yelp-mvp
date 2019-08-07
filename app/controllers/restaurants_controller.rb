class RestaurantsController < ApplicationController
  before_action :find_article, only: [:show]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    new_restaurant = Restaurant.create(restaurant_strong_params)
    redirect_to restaurant_path(new_restaurant)
  end

  private

  def restaurant_strong_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id].to_i)
  end
end
