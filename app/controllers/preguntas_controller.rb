class PreguntasController < ApplicationController
  include ApplicationHelper
  before_filter :authenticate
  
  before_action :set_pregunta, only: [:show, :edit, :update, :destroy]

  # GET /preguntas
  # GET /preguntas.json
  def index
    if(params[:id_dinosaurio])
      @dinosaurio = Dinosaurio.find(params[:id_dinosaurio])
      @preguntas = Pregunta.where(dinosaurio_id: params[:id_dinosaurio]).all
    else
      @preguntas = Pregunta.all
    end
  end

  # GET /preguntas/1
  # GET /preguntas/1.json
  def show
  end

  # GET /preguntas/new
  def new
    @pregunta = Pregunta.new
    @pregunta.init_respuestas
  end

  # GET /preguntas/1/edit
  def edit
  end

  # POST /preguntas
  # POST /preguntas.json
  def create
    @pregunta = Pregunta.new(pregunta_params)

    respond_to do |format|
      if @pregunta.save
        format.html { redirect_to @pregunta, notice: 'Pregunta fue creada con exito.' }
        format.json { render :show, status: :created, location: @pregunta }
      else
        format.html { render :new }
        format.json { render json: @pregunta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /preguntas/1
  # PATCH/PUT /preguntas/1.json
  def update
    respond_to do |format|
      if @pregunta.update(pregunta_params)
        format.html { redirect_to @pregunta, notice: 'Pregunta fue actualizada con exito.' }
        format.json { render :show, status: :ok, location: @pregunta }
      else
        format.html { render :edit }
        format.json { render json: @pregunta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /preguntas/1
  # DELETE /preguntas/1.json
  def destroy
    @pregunta.destroy
    respond_to do |format|
      format.html { redirect_to preguntas_url, notice: 'Pregunta fue eliminada con exito.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pregunta
      @pregunta = Pregunta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pregunta_params
      params.require(:pregunta).permit(:contenido, :dinosaurio_id,
          :respuestas_attributes => [:id, :contenido, :es_correcta, :feedback])
    end
end
