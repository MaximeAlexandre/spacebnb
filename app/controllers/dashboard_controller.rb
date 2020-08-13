class DashboardController < ApplicationController

  def renter
    mes_annonces
    reservations_received
  end

  def tenant
    mes_reservations
  end

  def annonce_details
  end

  def reservation_details
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
  end
end

