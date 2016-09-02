class Cd < ApplicationRecord
  belongs_to :catalogo

  validates :cantidad,
    presence: {message: "no puede ser vacío"},
    numericality: {
      greater_than_or_equal: 0,
      only_integer: true
    }

  validates :precio,
    numericality: {
      greater_than: 0,
      message: "debe ser mayor que 0"
    },
    allow_blank: true

  def cds?
    cantidad > 0
  end
end
