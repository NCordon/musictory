class VentasController < ApplicationController
  def index
    @ventas = Venta.all
  end

  def new
    @venta = Venta.new
  end

  def edit
  end

  def create
    @catalogo = Catalogo.find params[:catalogo_id]
    @venta = @catalogo.ventas.build venta_params

    if @catalogo.save
      update_stock @venta, -1
      redirect_to @catalogo
    else
      render 'new'
    end
  end


  def show
    @venta = Venta.find params[:id]
    @catalogo = @venta.catalogo
  end


  def destroy
    @venta = Venta.find(params[:id])

    if @venta.destroy
      update_stock @venta, +1
    end

    redirect_to ventas_path
  end

  private
    def venta_params
      if params[:venta][:formato] === "cd"
        params[:venta][:precio] = Cd.where(catalogo_id: params[:catalogo_id]).first.precio
      elsif params[:venta][:formato] === "vinilo"
        params[:venta][:precio] = Vinilo.where(catalogo_id: params[:catalogo_id]).first.precio
      end
      params.require(:venta).permit(:precio,:fechaVenta,:formato,:observaciones)
    end


    def update_stock(venta, offset)
      if venta.cd?
        @cd = Cd.where(catalogo_id: venta.catalogo_id)
        @cd.update cantidad: (@cd.first[:cantidad] + offset)
      elsif venta.vinilo?
        @vinilo = Vinilo.where(catalogo_id: venta.catalogo_id)
        @vinilo.update cantidad: (@vinilo.first[:cantidad] + offset)
      end
    end

end
