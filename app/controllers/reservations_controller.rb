class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update]

  def index
    @reservations = Reservation.all.where(user_id: "#{current_user[:id]}")
    raise
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
    # /planets/:planet_id/reservations
    @reservation.planet_id = params[:planet_id] # à verifier
    @reservation.user_id = current_user[:id]
    @reservation.status = "pending"
    if @reservation.save
      redirect_to reservations_path(@reservation)
    else
      # render "/reservations/new"
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

