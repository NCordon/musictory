class PedidosController < ApplicationController
  def index
    @pedidos = Pedido.all.order("fecha_realizacion DESC")

    if params[:search]
      @pedidos = Pedido.search(params[:search]).order("fecha_realizacion DESC")
    end
  end

  def new
    @pedido = Pedido.new
  end

  def create
    @pedido = Pedido.new(pedido_params)

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
    @pedido.fecha_cancelacion = Time.now

    if @pedido.save
      redirect_to pedidos_path
    else
      render 'index'
    end
  end


  def received
    @pedidos = Pedido.where.not(fecha_entrada: nil).order("fecha_entrada DESC")

    if params[:search]
      @pedidos = Pedido.where.not(fecha_entrada: nil).search(params[:search]).order("fecha_entrada DESC")
    end
  end

  def non_received
    @pedidos = Pedido.where(fecha_entrada: nil).where(fecha_cancelacion: nil).order("fecha_realizacion DESC")

    if params[:search]
      @pedidos = Pedido.where(fecha_entrada: nil).where.not(fecha_cancelacion: nil).search(params[:search]).order("fecha_realizacion DESC")
    end
  end


  def cancelled
    @pedidos = Pedido.where.not(fecha_cancelacion: nil).order("fecha_cancelacion DESC")

    if params[:search]
      @pedidos = Pedido.where.not(fecha_cancelacion: nil).search(params[:search]).order("fecha_cancelacion DESC")
    end
  end


  def receive_order
    @pedido = Pedido.find(params[:id])
    @pedido.fecha_entrada = Time.now
    @catalogo = Catalogo.where(titulo: @pedido.titulo, grupo: @pedido.grupo).first

    if @pedido.save
      if @catalogo.nil?
        params = {:titulo => @pedido.titulo, :grupo => @pedido.grupo}
        @catalogo = Catalogo.new params
        @catalogo.save
      end

      if @pedido.cd?
        @catalogo.cd.cantidad = @catalogo.cd.cantidad + @pedido.cantidad
      elsif @pedido.vinilo?
        @catalogo.vinilo.cantidad = @catalogo.vinilo.cantidad + @pedido.cantidad
      end

        @catalogo.save

      redirect_to pedidos_path
    else
      render 'index'
    end
  end

  private
    def pedido_params
      params[:pedido][:fecha_realizacion] = Time.now
      params.require(:pedido).permit(:titulo,:grupo,:fecha_realizacion,:formato,:cantidad)
    end
end
