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

  def receive_order
    @pedido = Pedido.find(params[:id])
    @pedido.fechaEntrada = Time.now

    if @pedido.save
      if @pedido.cd?
        @cd = Cd.where(catalogo_id: @pedido.catalogo_id).first
        @cd.cantidad = @cd.cantidad + @pedido.cantidad
        @cd.save
      elsif @pedido.vinilo?
        @vinilo = Vinilo.where(catalogo_id: @pedido.catalogo_id).first
        @vinilo.cantidad = @vinilo.cantidad + @pedido.cantidad
        @vinilo.save
      end

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
