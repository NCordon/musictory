class Pedido < ApplicationRecord
  belongs_to :catalogo
  belongs_to :proveedor

  validates :adeudo, presence: true, numericality: {greater_than: 0}

  validates :cantidad, presence: true,
    numericality: {greater_than: 0, only_integer: true,
      message: "Se esperaba un número mayor que 0"}

  validates :formato, inclusion: { in: %w(CD Vinilo),
    message: "%{value} no es un formato válido. Se esperaba CD o Vinilo" }

  validates :fechaRealizacion, presence: true

  validates_date_of :fechaRealizacion, before:  Proc.new { Time.now }

  validates_date_of :fechaEntrada, after: :fechaRealizacion,
    unless: Proc.new { |a| a.fechaEntrada.nil?},
    message: "La fecha de entrada debe ser posterior a la de realización del pedido"

  validates_date_of :fechaCancelacion, after: :fechaRealizacion, before: :fechaEntrada,
    unless: Proc.new { |a| a.fechaCancelacion.nil? },
    message: "La fecha de cancelación debe ser posterior a la de realización del
      pedido, y anterior a la fecha de entrada"

  validates_date_of :fechaFinalizacion, after: :fechaEntrada,
    unless: Proc.new { |a| a.fechaFinalizacion.nil? },
    message: "La fecha de finalización de pedido debe ser posterior a la de entrada"

  validates_date_of :fechaDefecto, after: :fechaEntrada,
    unless: Proc.new { |a| a.fechaDefecto.nil? },
    message: "La fecha de defecto debe ser posterior a la de entrada"
end
