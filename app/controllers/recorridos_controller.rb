class RecorridosController < ApplicationController
  def index
  	@recorridos = Recorrido.all
  end

  def new
  end

  def destroy
  	@recorrido.destroy
    respond_to do |format|
      format.html { redirect_to dinosaurios_url, notice: 'Recorrido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show
    @recorrido = Recorrido.find(params[:id])
  end


end
