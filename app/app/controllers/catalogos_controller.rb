class CatalogosController < ApplicationController
  def index
    @catalogos = Catalogo.all
    @catalogo = Catalogo.new

    if params[:search]
      @catalogos = Catalogo.search(params[:search])
    else
      @catalogos = Catalogo.all
    end
  end


  def new
    @catalogo = Catalogo.new
  end


  def edit
    @catalogo = Catalogo.find(params[:id])
  end


  def create
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

    if @catalogo.destroy
      redirect_to catalogos_path
    else
      #render partial: '/shared/errors', object: @catalogo
      render 'index'
    end
  end


  def show
    @catalogo = Catalogo.find(params[:id])
  end

  private
    def album_params
      params.require(:catalogo).permit(:titulo, :grupo, :genero, :portada,
        cd_attributes: [:cantidad, :precio],
        vinilo_attributes: [:cantidad, :precio])
    end

end
