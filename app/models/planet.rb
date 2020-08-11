class Planet < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many :reviews, through: :reservations

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :user_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
