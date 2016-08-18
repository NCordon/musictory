class VentasController < ApplicationController
  def new
  end


  def create
    v = Venta.require(new(params[:id])
  end

  private
    def venta_params
      params.require(:venta).permit(:precio,:fechaVenta,:formato)
    end

end
