class RecorridosController < ApplicationController
  before_action :set_recorrido, only: [:show, :edit, :update, :destroy]

  def index
  	@recorridos = Recorrido.all
  end

  def new
  end

  def destroy
  	@recorrido.destroy
    respond_to do |format|
      format.html { redirect_to recorridos_url, notice: 'Recorrido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show
    @recorrido = Recorrido.find(params[:id])
  end

  private
    def set_recorrido
      @recorrido = Recorrido.find(params[:id])
    end

end
