class ReservationsController < ApplicationController
    before_action :set_reservation, only: [:edit, :update]

    def new
        @reservation = Reservation.new
    end

    def create
        @reservation = Reservation.new(reservation_params)
        @reservation.planet = params[:id] # à verif
        # @reservation.user = ou recupere t on l'user?
        if @reservation.save
          redirect_to planet_reservations_path(@reservation)
          # /planets/:planet_id/reservations
        else
          render :new
        end
    end

    def edit
    end

    def update
        @reservation.save
        redirect_to planet_reservations_path(@reservation)
        # /planets/:planet_id/reservations
    end

    private

    def set_reservation
        @reservation = Reservation.find(params[:id])
    end
        
    def reservation_params
        params.require(:reservation).permit(:status, :start_date, :end_date, :user, :planet)
    end
end

