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

  validate :empty_stock?
  after_create :update_stock

  def empty_stock?
    errors.add(:base, 'No hay stock de CDs disponible') if none_cds?
    errors.add(:base, 'No hay stock de Vinilos disponible') if none_vinilos?
  end

  def none_cds?
    not Cd.exists?(["catalogo_id = #{catalogo_id} and cantidad>0"]) if formato==="CD"
  end

  def none_vinilos?
    not Vinilo.where("catalogo_id = catalogo_id and cantidad>0") if formato==="Vinilo"
  end

  def update_stock
    if formato==="CD"
      @cd = Cd.where(catalogo_id: catalogo_id)
      @cd.update cantidad: (@cd.first[:cantidad] - 1)
    elsif formato==="Vinilo"
      @vinilo = Vinilo.where(catalogo_id: catalogo_id)
      @vinilo.update cantidad: (@vinilo.first[:cantidad] - 1)
    end
  end

end
