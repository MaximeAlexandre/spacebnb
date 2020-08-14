class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update]

  def index
    @reservations = current_user.reservations
  end

  def show
    @review = Review.new
  end

  def new
    start_date = session[:start_date]
    end_date = session[:end_date]
    @reservation = Reservation.new(start_date: start_date, end_date: end_date)
    @planet = Planet.find(params[:planet_id])
    @number_of_days = (end_date.to_date - start_date.to_date).to_i
    @total_price = @number_of_days * @planet.price
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @planet = Planet.find(params[:planet_id])
    @reservation.planet = @planet
    @reservation.user = current_user
    @reservation.status = "pending"
    if @reservation.save
      session[:galaxy_input] = ""
      redirect_to tenant_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @reservation.save
    redirect_to redetails_path(@reservation)
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
