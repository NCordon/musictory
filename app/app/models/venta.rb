class Venta < ApplicationRecord
  enum formato: [:cd, :vinilo]

  belongs_to :catalogo

  validates :precio,
    presence: {message: "%{value} no puede ser vacío"},
    numericality: {
      greater_than: 0,
      message: "%{value} debe ser mayor que 0"
    }

  validates :fechaVenta,
    presence: {message: "%{value} no puede ser vacío"}

  validates_date_of :fechaVenta,
    before:  Proc.new { Time.now },
    message: "Fecha de venta debe ser anterior a hoy"

  validates :formato,
    presence: {message: "%{value} no puede ser vacío"}

  validate :empty_stock?
  #after_create :update_stock

  def empty_stock?
    errors.add(:base, 'No hay stock de CDs disponible') if none_cds?
    errors.add(:base, 'No hay stock de Vinilos disponible') if none_vinilos?
  end

  def none_cds?
    not Cd.exists?(["catalogo_id = #{catalogo_id} and cantidad>0"]) if cd?
  end

  def none_vinilos?
    not Vinilo.exists?(["catalogo_id = #{catalogo_id} and cantidad>0"]) if vinilo?
  end
end
