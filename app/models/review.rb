class Review < ApplicationRecord
  RATINGS = (0..5).to_a

  # Relationships
  belongs_to :restaurant

  # Validations
  validates :customer_name, presence: true
  validates :content, presence: true
  validates :rating, numericality: true, inclusion: {in: RATINGS}
end
