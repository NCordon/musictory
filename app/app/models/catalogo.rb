class Catalogo < ApplicationRecord
  validates :titulo,
    presence: {message: "%{value} no puede ser vacío"}
  validates :grupo,
    presence: {message: "%{value} no puede ser vacío"}
  validates :genero,
    presence: {message: "%{value} no puede ser vacío"}

  has_one :cd, dependent: :destroy
  has_one :vinilo, dependent: :destroy
  after_create :setStock
  accepts_nested_attributes_for :cd
  accepts_nested_attributes_for :vinilo

  has_many :ventas

  def setStock
    create_cd cantidad:0
    create_vinilo cantidad:0
  end
end
