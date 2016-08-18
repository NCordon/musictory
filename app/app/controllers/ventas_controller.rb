class VentasController < ApplicationController
  def new
  end

  def edit
  end

  def create
    @catalogo = Catalogo.find params[:venta][:catalogo_id]
    @venta = @catalogo.ventas.create venta_params

    redirect_to venta_path @venta
  end

  def show
  end

  private
    def venta_params
      params.require(:venta).permit(:precio,:fechaVenta,:formato)
    end

end
