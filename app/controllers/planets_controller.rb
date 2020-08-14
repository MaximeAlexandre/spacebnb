class PlanetsController < ApplicationController
  before_action :set_planet, only: [:show, :edit, :update, :destroy]

  def index
    session[:start_date] = params[:start_date_input]
    session[:end_date] = params[:end_date_input]
    if params[:galaxy_input].present?
      sql_query = "planets.address @@ :galaxy_input"
      @planets = Planet.where(sql_query, galaxy_input: "%#{params[:galaxy_input]}%")
    else
      @planets = Planet.all
    end

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
     @reviews = []
     reservations = Reservation.where(planet_id: @planet.id)
        reservations.each do |reservation|
          review = Review.find_by(reservation_id: reservation.id)
            @reviews << review unless review.nil?
      end
  end

  def edit
  end

  def update
    @planet.update(planet_params)
    redirect_to andetails_path(@planet)
  end

  def destroy
    @planet.destroy
    redirect_to renter_path
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
