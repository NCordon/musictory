class Venta < ApplicationRecord
  belongs_to :catalogo
  validates :precio, presence: true, numericality: {greater_than: 0,
    message: "Precio inválido"}
  validates :fechaVenta, presence: true
  validates :formato, inclusion: { in: %w(CD Vinilo),
    message: "%{value} no es un formato válido. Se esperaba CD o Vinilo" }
end
