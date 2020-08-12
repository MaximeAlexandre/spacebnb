class Review < ApplicationRecord
  belongs_to :user
  belongs_to :reservation

  validates :note, presence: true, numericality: { only_integer: true },
  inclusion: { in: 0..5, message: "It is not a valid note" }
  validates :content, presence: true
end
