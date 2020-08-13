class PlanetsController < ApplicationController
  before_action :set_planet, only: [:show, :edit, :update, :destroy]

  def index
    @planets = policy_scope(Planet).order(created_at: :desc)
  end

  def new
    @planet = current_user.planets.new
    authorize @planet
  end

  def create
    @planet = current_user.planets.new(planet_params)
    authorize @planet
    if @planet.save
      redirect_to andetails_path(@planet)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @planet.update(planet_params)
    redirect_to andetails_path(@planet)
  end

  def destroy
    @planet.destroy
    redirect_to planets_path
  end

  private

  def planet_params
    params.require(:planet).permit(:name, :address, :description, :price, :start_date, :end_date)
  end

  def set_planet
    @planet = Planet.find(params[:id])
    authorize @planet
  end
end
