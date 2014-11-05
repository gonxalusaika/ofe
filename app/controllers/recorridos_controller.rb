class RecorridosController < ApplicationController
  before_action :set_recorrido, only: [:show, :edit, :update, :destroy]

  def index
  	@recorridos = Recorrido.all
  end

  def new
    @dinosaurios = Dinosaurio.all
    @preguntas = Pregunta.all
  end

  def destroy
  	@recorrido.destroy
    respond_to do |format|
      format.html { redirect_to recorridos_url, notice: 'Recorrido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show
  end

  def edit
    @dinosaurios = Dinosaurio.all
    @preguntas = Pregunta.all
  end


  private
    def set_recorrido
      @recorrido = Recorrido.find(params[:id])
    end

end
