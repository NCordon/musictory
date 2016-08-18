class Catalogo < ApplicationRecord
  validates :titulo, presence: {message: "es necesario"}
  validates :grupo, presence: {message: "es necesario"}
  validates :genero, presence: {message: "es necesario"}

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
