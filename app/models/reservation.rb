class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :planet

  validates :start_date, presence: true # format date a rajouter?
  validates :end_date, presence: true # format date a rajouter?
  validates :status, presence: true # inclusion: { in: %w(pending ... ...),
  # message: "%{value} is not a valid status" }
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    errors.add(:end_date, "must be after the start date") if end_date < start_date
  end
end
