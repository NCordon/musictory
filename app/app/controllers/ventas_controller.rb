class VentasController < ApplicationController
  def index
    @ventas = Venta.all.order("fecha_venta DESC")

    if params[:search]
      @ventas = Venta.search(params[:search]).order("fecha_venta DESC")
    end
  end

  def new
    @venta = Venta.new
  end

  def edit
    @venta = Venta.find(params[:id])
  end

  def create
    @catalogo = Catalogo.find params[:catalogo_id]
    @venta = @catalogo.ventas.build venta_params

    if @venta.save
      update_stock @venta, -1
      redirect_to venta_path(@venta)
    else
      render 'new'
    end
  end


  def update
    @venta = Venta.find(params[:id])

    if @venta.update venta_params
      redirect_to venta_path(@venta)
    else
      render 'edit'
    end
  end


  def destroy
    @venta = Venta.find(params[:id])

    if @venta.destroy
      update_stock @venta, +1
    end

    redirect_to ventas_path
  end


  def show
    @venta = Venta.find params[:id]
    @catalogo = @venta.catalogo
  end


  private
    def venta_params
      if params[:venta][:formato] === "cd"
        params[:venta][:precio] = Cd.where(catalogo_id: params[:catalogo_id]).first.precio
      elsif params[:venta][:formato] === "vinilo"
        params[:venta][:precio] = Vinilo.where(catalogo_id: params[:catalogo_id]).first.precio
      end
      params.require(:venta).permit(:precio,:fecha_venta,:formato,:observaciones)
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
