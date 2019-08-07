class ReviewsController < ApplicationController
  before_action :find_restaurant

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(reviews_strong_params)
    @review.restaurant =  @restaurant

    if @review.save #return true or false
      redirect_to restaurant_path(@review.restaurant)
    else
      render :new
    end
  end

  private

  def reviews_strong_params
    params.require(:review).permit(:content, :rating)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id].to_i)
  end
end
