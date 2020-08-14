class DashboardController < ApplicationController
  before_action :set_reservation, only: [:reservation_annul, :reservation_valide]

  def renter
    mes_annonces
    reservations_received
    #raise
  end

  def tenant
    mes_reservations
    
  end

  def annonce_details
    @planet = Planet.find(params[:id])
  end

  def reservation_details
  end

  def reservation_valide
    @reservation.status = params[:i][:reservation_valide]
    @reservation.save
    redirect_to renter_path
  end

  def reservation_annul
    @reservation.status = "annule"
    @reservation.save
    redirect_to tenant_path
  end

  private

  def mes_annonces
    @planets = policy_scope(Planet).where(user_id: "#{current_user[:id]}").order(created_at: :desc)
  end

  def mes_reservations
    @reservations = Reservation.all.where(user_id: "#{current_user[:id]}")
    @res_futur = []
    @res_past = []
    @reservations.each { |i| DateTime.now <= i.end_date ? @res_futur << i : @res_past << i }
  end

  def reservations_received
    @planets_list = policy_scope(Planet).where(user_id: "#{current_user[:id]}")
    @planets_ids = [] 
    @planets_list.each { |i| @planets_ids << i.id }
    @res_rec = Reservation.all.where(planet_id: @planets_ids)
    @res_rec_pending = @res_rec.where(status: "pending")
    @res_rec_not_pending = @res_rec.where.not(status: "pending")
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
end

