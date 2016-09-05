class Venta < ApplicationRecord
  enum formato: [:cd, :vinilo]

  belongs_to :catalogo

  validates :precio,
    presence: {message: "no puede ser vacío"},
    numericality: {
      greater_than: 0,
      message: "debe ser mayor que 0"
    },
    on: :create

  validates :fecha_venta,
    presence: {message: "no puede ser vacío"}

  validates_date_of :fecha_venta,
    before_or_equal_to:  Proc.new { Time.now },
    message: "debe ser anterior a hoy"

  validates :formato,
    inclusion: {
      in: formatos.keys,
      message: "no es un formato válido. Se esperaba CD o Vinilo"
    },
    presence: {message: "no puede ser vacío"},
    on: :create

  validate :empty_stock?, on: :create
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

  def self.search(search)
    joins(:catalogo).where("titulo LIKE ? OR grupo LIKE ? OR fecha_venta LIKE ?",
      "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
