class PedidosController < ApplicationController
  def index
    @pedidos = Pedido.all

    if params[:search]
      @Pedido = Pedido.search(params[:search]).order("fechaRealizacion DESC")
    end
  end

  def new
    @pedido = Pedido.new
  end

  def create
    @catalogo = Catalogo.find params[:catalogo_id]
    @pedido = @pedido.ventas.build venta_params

    if @pedido.save
      redirect_to venta_path(@pedido)
    else
      render 'new'
    end
  end

  private
    def pedido_params
      params.require(:pedido).permit(:adeudo,:fechaRealizacion,:formato,:cantidad)
    end
end
