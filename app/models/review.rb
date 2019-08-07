class Review < ApplicationRecord
  # Relationships
  belongs_to :restaurant

  # Validations
  validates :content, presence: true
  validates :rating, numericality: true, inclusion: {in: [0, 1, 2, 3, 4, 5]}
end
