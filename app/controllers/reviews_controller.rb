class ReviewsController < ApplicationController
  def new
    # raise
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    # raise
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # on vérifie que tous les champs renseignés dans le formulaire sont valides
  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
