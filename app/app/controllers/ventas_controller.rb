class VentasController < ApplicationController
  def new
  end


=begin
  def create
    v = Venta.require(new(params[:id])

  end

  private
    def venta_params
      params.require(:venta).permit(:titulo,:grupo,:genero)
    end
=end

end
