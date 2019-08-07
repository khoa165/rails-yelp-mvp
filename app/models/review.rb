class Review < ApplicationRecord
  # Relationships
  belongs_to :restaurant

  # Validations
  validates :content, presence: true
  validates :rating, inclusion: {in: %w(0 1 2 3 4 5)}
end
