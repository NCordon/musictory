class CdsController < ApplicationController
  def new
  end

  def destroy
    @cd = Cd.find(params[:id])
    @cd.destroy
  end
end
