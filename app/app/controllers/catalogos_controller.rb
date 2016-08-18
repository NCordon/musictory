class CatalogosController < ApplicationController
  def index
    @catalogos = Catalogo.all
  end


  def new
    @catalogo = Catalogo.new
  end


  def edit
    @catalogo = Catalogo.find(params[:id])
  end


  def create
    #render plain: params[:catalogo].inspect

    @catalogo = Catalogo.new(album_params)

    if @catalogo.save
      redirect_to @catalogo
    else
      render 'new'
    end
  end


  def update
    @catalogo = Catalogo.find(params[:id])

    if @catalogo.update album_params
      redirect_to @catalogo
    else
      render 'edit'
    end
  end


  def destroy
    @catalogo = Catalogo.find(params[:id])
    @catalogo.destroy

    redirect_to catalogos_path
  end


  def show
    @catalogo = Catalogo.find(params[:id])
  end

  private
    def album_params
      params.require(:catalogo).permit(:titulo,:grupo,:genero,
        cd_attributes: [:cantidad],
        vinilo_atributes: [:cantidad])
    end

end
