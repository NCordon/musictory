class Pedido < ApplicationRecord
  belongs_to :catalogo
  belongs_to :proveedor
end
