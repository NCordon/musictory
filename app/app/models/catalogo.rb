class Catalogo < ApplicationRecord
  validates :titulo, presence: true
  validates :grupo, presence: true
  validates :genero, presence: true

  has_one :cd, dependent: :destroy
  has_one :vinilo, dependent: :destroy
  after_create :setStock
  #accepts_nested_attributes_for :cd
  #accepts_nested_attributes_for :vinilo

  has_many :ventas

  def setStock
    create_cd cantidad:0
    create_vinilo cantidad:0
  end
end
