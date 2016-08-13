class CatalogosController < ApplicationController
  def index
    @albums = Catalogo.all
  end

  def new
  end

  def create
    #render plain: params[:catalogo].inspect

    @album = Catalogo.new(album_params)
    @album.save
    redirect_to @album
  end

  def show
    @album = Catalogo.find(params[:id])
  end

  private
    def album_params
      params.require(:catalogo).permit(:titulo,:grupo,:genero)
    end
end
