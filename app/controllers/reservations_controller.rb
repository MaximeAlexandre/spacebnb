class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update]

  def index
    @reservations = Reservation.all.where(user_id: "#{current_user[:id]}")
  end

  def show
  end

  def new
    @reservation = Reservation.new
    @planet = Planet.find(params[:planet_id])
    # /planets/:planet_id/reservations/new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @planet = Planet.find(params[:planet_id])

    # /planets/:planet_id/reservations
    @reservation.planet = @planet
    @reservation.user = current_user
    @reservation.status = "pending"
    if @reservation.save
      redirect_to reservations_path(@reservation)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @reservation.save
    redirect_to reservations_path(@reservation) # ou refresh page / card(javascript)
    # /reservations
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
