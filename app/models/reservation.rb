class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :planet

  validates :user, presence: true
  validates :planet, presence: true
  validates :start_date, presence: true # format date a rajouter?
  validates :end_date, presence: true # format date a rajouter?
  validates :status, presence: true # inclusion: { in: %w(pending ... ...),
  # message: "%{value} is not a valid status" }
end
