class Planet < ApplicationRecord
  belongs_to :user

  validates :name, presences: true
  validates :address, presences: true
  validates :description, presences: true
  validates :price, presences: true
  validates :user_id, presences: true
  validates :start_date, presences: true
  validates :end_date, presences: true
end
