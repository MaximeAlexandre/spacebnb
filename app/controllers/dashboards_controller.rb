class DashboardsController < ApplicationController

  def renter
    mes_annonces
    reservations_received
  end

  def tenant
  end

  def show_renter
  end

  def show_tenant
  end

  private

  def mes_annonces
    @planets = policy_scope(Planet).where(user_id: "#{current_user[:id]}").order(created_at: :desc)
  end

  def reservations_received
  end
end
