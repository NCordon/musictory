class Catalogo < ApplicationRecord
  validates :titulo,
    presence: {message: "%{value} no puede ser vacío"}
  validates :grupo,
    presence: {message: "%{value} no puede ser vacío"}
  validates :genero,
    presence: {message: "%{value} no puede ser vacío"}

  has_attached_file :portada, styles: { medium: "400x400>", thumb: "100x100>" },
    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :portada, content_type: /\Aimage\/.*\z/

  has_one :cd, dependent: :destroy
  has_one :vinilo, dependent: :destroy
  after_create :setStock
  accepts_nested_attributes_for :cd
  accepts_nested_attributes_for :vinilo

  has_many :ventas, dependent: :destroy

  def setStock
    create_cd cantidad:0
    create_vinilo cantidad:0
  end
end
