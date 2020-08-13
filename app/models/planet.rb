class Planet < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many :reviews, through: :reservations

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :start_date, presence: true # format date a rajouter?
  validates :end_date, presence: true # format date a rajouter?
  validates :end_date_after_start_date

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    errors.add(:end_date, "must be after the start date") if end_date < start_date
  end
end
