class Catalogo < ApplicationRecord
  validates :titulo,
    presence: {message: "no puede ser vacío"}
  validates :grupo,
    presence: {message: "no puede ser vacío"}
  #validates :genero,
  #  presence: {message: "%{value} no puede ser vacío"}

  has_attached_file :portada, styles: { medium: "350x350>", thumb: "100x100>" },
    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :portada, content_type: /\Aimage\/.*\z/

  validates_uniqueness_of :titulo, :scope => [:grupo], message: "Ya existe en base de datos"

  has_one :cd, dependent: :destroy
  has_one :vinilo, dependent: :destroy

  after_create :setStock
  accepts_nested_attributes_for :cd
  accepts_nested_attributes_for :vinilo

  has_many :ventas, dependent:  :restrict_with_error
    #message: "no se puede eliminar, tiene facturación asociada"
  #has_many :pedidos, dependent: :destroy



  def setStock
    create_cd cantidad:0
    create_vinilo cantidad:0
  end

  def self.search(search)
    where("titulo LIKE ? OR grupo LIKE ?", "%#{search}%", "%#{search}%")
  end
end
