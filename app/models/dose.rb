class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient #belongs to ie. the dose has an ingredient id

  validates :description, presence: true
  validates :cocktail, presence: true, uniqueness: { scope: :ingredient,
    message: "An ingredient can only be used once per cocktail" }
  validates :ingredient, presence: true
end
