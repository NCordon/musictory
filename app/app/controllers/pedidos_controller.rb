class PedidosController < ApplicationController
  def index
    @pedidos = Pedido.all

    if params[:search]
      @pedidos = Pedido.search(params[:search]).order("fechaRealizacion DESC")
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
    @pedido = Pedido.find(params[:id])

    if @pedido.destroy
      redirect_to pedidos_path
    end
  end

  def show
  end

  def cancel_order
    @pedido = Pedido.find(params[:id])
    @pedido.fechaCancelacion = Time.now

    if @pedido.save
      redirect_to pedidos_path
    else
      render 'index'
    end
  end

  private
    def pedido_params
      params[:pedido][:fechaRealizacion] = Time.now
      params.require(:pedido).permit(:fechaRealizacion,:formato,:cantidad)
    end
end
