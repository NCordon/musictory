class Cd < ApplicationRecord
  belongs_to :catalogo

  validates :cantidad,
    presence: {message: "%{value} no puede ser vacío"},
    numericality: {
      greater_than_or_equal: 0,
      only_integer: true,
      message: "%{value} debe ser mayor que 0"
    }

  validates :precio,
    presence: {message: "%{value} no puede ser vacío"},
    numericality: {
      greater_than: 0,
      message: "%{value} debe ser mayor que 0"
    }, if: :cds?

  def cds?
    cantidad > 0
  end
end
