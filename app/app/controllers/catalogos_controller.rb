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
    @cd = @catalogo.cd
    @vinilo = @catalogo.vinilo

    if @catalogo.update album_params and @cd.update cd_params and @vinilo.update vinilo_params
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
      params.require(:catalogo).permit(:titulo,:grupo,:genero)
    end

    def cd_params
      params.require(:cd).permit(:cantidad)
    end

    def vinilo_params
      params.require(:vinilo).permit(:cantidad)
    end

end
