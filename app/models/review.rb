# class Review
class Review < ApplicationRecord
  belongs_to :restaurant

  validates :content, presence: true

  validates :rating, presence: true
  validates :rating, inclusion: { in: (0..5).to_a, message: 'Your rating must be a number betwwen 0 and 5' }
  validates :rating, numericality: { only_integer: true }
end
