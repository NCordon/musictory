class PedidosController < ApplicationController
  def index
    @pedidos = Pedido.all

    if params[:search]
      @Pedido = Pedido.search(params[:search]).order("fechaRealizacion DESC")
    end
  end

  def new
  end

  def create
  end
end
