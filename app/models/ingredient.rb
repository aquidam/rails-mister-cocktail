class Ingredient < ApplicationRecord
  has_many :doses
  has_many :cocktail, through: :doses
  validates :name, uniqueness: true, presence: true, allow_blank: false

end

