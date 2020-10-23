class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail
  validates :description, presence: true
  validates :cocktail, :ingredient, uniqueness: { scope: [:ingredient, :cocktail] }
end
