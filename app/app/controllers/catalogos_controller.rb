class CatalogosController < ApplicationController
  def index
    @albums = Catalogo.all
  end


  def new
  end


  def edit
    @album = Catalogo.find(params[:id])
  end


  def create
    #render plain: params[:catalogo].inspect

    @album = Catalogo.new(album_params)
    @album.save
    redirect_to @album
  end


  def update
    @album = Catalogo.find(params[:id])

    if @album.update(album_params)
      redirect_to @album
    else
      render 'edit'
    end
  end


  def destroy
    @album = Catalogo.find(params[:id])
    @album.destroy

    redirect_to catalogo_path
  end


  def show
    @album = Catalogo.find(params[:id])
  end

  private
    def album_params
      params.require(:catalogo).permit(:titulo,:grupo,:genero)
    end
end
