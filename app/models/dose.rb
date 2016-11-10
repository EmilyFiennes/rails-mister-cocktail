class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, presence: true
  validates :cocktail, presence: true, uniqueness: { scope: :ingredient,
    message: "An ingredient can only be used once per cocktail" }
  validates :ingredient, presence: true
end
