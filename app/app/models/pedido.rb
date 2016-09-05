class Pedido < ApplicationRecord
  belongs_to :catalogo
  enum formato: [:cd, :vinilo]
  #belongs_to :proveedor

  #validates :adeudo, presence: true, numericality: {greater_than: 0}
  validates :titulo,
    presence: {message: "%{value} no puede ser vacío"}

  validates :grupo,
    presence: {message: "%{value} no puede ser vacío"}

  validates :cantidad, presence: {message: "%{value} no puede ser vacío"},
    numericality: {
      greater_than: 0,
      only_integer: true,
      message: "Se esperaba un número mayor que 0"
    }

  validates :formato,
    inclusion: {
      in: formatos.keys,
      message: "no es un formato válido. Se esperaba CD o Vinilo"
    }

  validates :fecha_realizacion, presence: true
  validates_date_of :fecha_realizacion, before_or_equal_to:  Proc.new { Time.now }

  validates_date_of :fecha_entrada,
    after: :fecha_realizacion,
    unless: Proc.new { |a| a.fecha_entrada.nil?},
    message: "debe ser posterior a la de realización del pedido",
    on: :update


  validates_date_of :fecha_cancelacion,
    after: :fecha_realizacion,
    unless: Proc.new { |a| a.fecha_cancelacion.nil? },
    if: Proc.new { |a| a.fecha_entrada.nil? },
    message: "debe ser posterior a la de realización del pedido,
      y no tratarse de un pedido recibido"

  #validates_date_of :fecha_finalizacion,
  #  after: :fecha_entrada,
  #  unless: Proc.new { |a| a.fecha_finalizacion.nil? },
  #  message: "debe ser posterior a la de entrada"

  #validates_date_of :fecha_defecto,
  #  after: :fecha_entrada,
  #  unless: Proc.new { |a| a.fecha_defecto.nil? },
  #  message: "debe ser posterior a la de entrada"

  def self.search(search)
    where("titulo LIKE ? OR grupo LIKE ? OR fecha_realizacion LIKE ?",
      "%#{search}%", "%#{search}%", "%#{search}%")
  end

  def portada
    @catalogo = Catalogo.where(titulo: titulo, grupo: grupo).first

    @catalogo.nil? ? "/images/thumb/missing.png" : @catalogo.portada(:thumb)
  end
end
