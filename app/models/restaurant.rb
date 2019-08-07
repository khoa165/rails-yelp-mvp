class Restaurant < ApplicationRecord
  # Constant
  CUISINES = %w(chinese italian japanese french belgian)

  # Relationships
  has_many :reviews, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :address, presence: true
  validates :category, inclusion: {in: CUISINES}
end
