class ViniloController < ApplicationController
  def new
  end

  def create
    @album = Catalogo.find(params[:catalogo_id])
    @vinilo = Cd.new(vinilo_params)
    @album.vinilo = @vinilo

    redirect_to catalogo_path(@album)
  end


  private
    def vinilo_params
      params.require(:vinilo).permit(:cantidad)
    end
end
