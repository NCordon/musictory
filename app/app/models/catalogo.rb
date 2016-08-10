class Catalogo < ApplicationRecord
  validates :titulo, presence: true
  validates :grupo, presence: true
  validates :genero, presence: true
end
