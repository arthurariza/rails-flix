class Review < ApplicationRecord
  belongs_to :movie

  STARTS = [1, 2, 3, 4, 5].freeze

  validates :name, presence: true
  validates :comment, length: { minimum: 4 }
  validates :starts, inclusion: {
    in: STARS,
    message: 'must be between 1 and 5'
  }
end
