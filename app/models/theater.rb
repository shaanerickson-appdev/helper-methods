class Theater < ApplicationRecord
  validates :name, presence: true
  validates :capacity, presence: true, numericality: { only_integer: true }
  validates :screens, presence: true, numericality: { only_integer: true }
end
