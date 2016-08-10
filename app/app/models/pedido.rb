class Pedido < ApplicationRecord
  belongs_to :catalogo
  belongs_to :proveedor
  validates :adeudo, presence: true, numericality: {greater_than: 0}
  validates :cantidad, presence: true, numericality: {greater_than: 0}
  validates :formato, inclusion: { in: %w(CD Vinilo),
    message: "%{value} no es un formato válido" }
  validates :fechaRealizacion, presence: true

  validates_date_of :fechaRealizacion, before:  Proc.new { Time.now }
  validates_date_of :fechaEntrada, after: :fechaRealizacion,
    unless: Proc.new { |a| a.fechaEntrada.nil? }
  validates_date_of :fechaCancelacion, after: :fechaRealizacion, before: :fechaEntrada,
    unless: Proc.new { |a| a.fechaCancelacion.nil? }
  validates_date_of :fechaFinalizacion, after: :fechaEntrada,
    unless: Proc.new { |a| a.fechaFinalizacion.nil? }
  validates_date_of :fechaDefecto, after: :fechaEntrada,
    unless: Proc.new { |a| a.fechaDefecto.nil? }
end
