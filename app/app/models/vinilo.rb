class Vinilo < ApplicationRecord
  belongs_to :catalogo
  validates :cantidad, presence: true, numericality: {greater_than_or_equal: 0, only_integer: true}
end
