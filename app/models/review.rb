class Review < ApplicationRecord
  belongs_to :user
  belongs_to :reservation

  validates :note, presence: true, inclusion: { in: %w(0..5),
  message: "%{value} is not a valid note" }
  validates :content, presence: true
  validates :user, presence: true
  validates :reservation, presence: true
end
