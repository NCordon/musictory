class VentasController < ApplicationController
  def new
    @venta = Venta.new
  end

  def edit
  end

  def create
    @catalogo = Catalogo.find params[:venta][:catalogo_id]
    @venta = @catalogo.ventas.build venta_params

    if @venta.save
      redirect_to venta_path @venta
    else
      render 'new'
    end
  end

  def show
    @venta = Venta.find params[:id]
    @catalogo = @venta.catalogo
  end

  private
    def venta_params
      params.require(:venta).permit(:precio,:fechaVenta,:formato)
    end

end
