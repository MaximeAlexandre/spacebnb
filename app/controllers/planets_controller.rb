class PlanetsController < ApplicationController
  before_action :set_planet, only: [:show, :edit, :update, :destroy]

  def index
    @planets = Planet.all
  end

  def new
   @planet = Planet.new
  end

  def create
    @user = User.find(params[:user_id])
    @planet = Planet.new(planet_params)
    @planet.user = @planet
    @planet.save


  end

  def show
  end

  def edit

  end

  def update
    @planet.update(planet_params)

  end

  def destroy
    @planet.destroy

  end


  private

  def planet_params
    params.require(:planet).permit(:name, :address, :description, :price, :start_date, :end_date)
  end

  def set_planet
    @planet = Planet.find(params[:id])
  end

end
