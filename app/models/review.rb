class Review < ApplicationRecord
  # Relationships
  belongs_to :restaurant

  # Validations
  validates :content, presence: true
  validates :rating, numericality: true, inclusion: {in: (0..5).to_a}
end
