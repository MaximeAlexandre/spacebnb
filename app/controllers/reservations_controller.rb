class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update]

  def index
    @reservations = Reservation.all.where(user_id: "#{current_user[:id]}")
  end

  def show
     @review = Review.new
  end

  def new
    start_date = session[:start_date]
    end_date = session[:end_date]
    # @number_of_days = (Date.parse end_date) - (Date.parse start_date)
    @reservation = Reservation.new(start_date: start_date, end_date: end_date)
    @planet = Planet.find(params[:planet_id])
    @number_of_days = (end_date.to_date - start_date.to_date).to_i
    @total_price = @number_of_days * @planet.price
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
      redirect_to tenant_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @reservation.save
    redirect_to redetails_path(@reservation) # ou refresh page / card(javascript)
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
