class RestaurantsController < ApplicationController
  def home
  end

  def index
    @restaurants = Restaurant.all
    # raise
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    # @reviews = Review.select { |review| review.restaurant = @restaurant }
    # raise
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params) # on appelle la fonction restaurant_params
    if @restaurant.save
      redirect_to restaurant_path(@restaurant) # on va vers la page du restaurant créé
    else
      render :new, status: :unprocessable_entity # on génère une erreur si tous les champs ne sont pas valides
    end
  end

  private

  # on vérifie que tous les champs renseignés dans le formulaire sont valides
  def restaurant_params
      params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
