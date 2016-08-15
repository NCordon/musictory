class CdsController < ApplicationController
  def new
  end

  def create
    @album = Catalogo.find(params[:catalogo_id])
    @cd = Cd.new(cd_params)
    @album.cd = @cd

    redirect_to catalogo_path(@album)
  end


  private
    def cd_params
      params.require(:cd).permit(:cantidad)
    end
end
