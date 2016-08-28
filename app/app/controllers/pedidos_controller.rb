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
    @pedido = @catalogo.pedidos.build pedido_params

    if @pedido.save
      redirect_to pedidos_path
    else
      render 'new'
    end
  end

  def destroy
  end

  def show
  end

  private
    def pedido_params
      params[:pedido][:fechaRealizacion] = Time.now
      params.require(:pedido).permit(:fechaRealizacion,:formato,:cantidad)
    end
end
