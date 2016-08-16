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
    @cd = @album.cd
    @vinilo = @album.vinilo

    if @album.update album_params and @cd.update cd_params and @vinilo.update vinilo_params
      redirect_to @album
    else
      render 'edit'
    end
  end


  def destroy
    @album = Catalogo.find(params[:id])
    @album.destroy

    redirect_to catalogos_path
  end


  def show
    @album = Catalogo.find(params[:id])
  end

  private
    def album_params
      params.require(:catalogo).permit(:titulo,:grupo,:genero)
    end

    def cd_params
      params.require(:cd).permit(:cantidad)
    end

    def vinilo_params
      params.require(:vinilo).permit(:cantidad)
    end

end
