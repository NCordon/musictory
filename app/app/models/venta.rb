class Venta < ApplicationRecord
  belongs_to :catalogo

  validates :precio,
    presence: {message: "%{value} no puede ser vacío"},
    numericality: {
      greater_than: 0,
      message: "%{value} debe ser mayor que 0"
    }

  validates :fechaVenta,
    presence: {message: "%{value} no puede ser vacío"}

  validates :formato,
    presence: {message: "%{value} no puede ser vacío"},
    inclusion: {
      in: %w(CD Vinilo),
      message: "%{value} no es un formato válido. Se esperaba CD o Vinilo"
    }
end
