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

    if @venta.save
      redirect_to venta_path @venta
    else
      render partial: '/shared/errors', object: @venta
    end
  end

  def show
    @venta = Venta.find params[:id]
    @catalogo = @venta.catalogo
  end


  def destroy
    @venta = Venta.find(params[:id])
    @venta.destroy

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

end
