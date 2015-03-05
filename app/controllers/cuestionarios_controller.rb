class CuestionariosController < ApplicationController
  include ApplicationHelper
  before_filter :authenticate
  
  before_action :set_cuestionario, only: [:show, :edit, :update, :destroy]
  

  # GET /cuestionarios
  # GET /cuestionarios.json
  def index
    @cuestionarios = Cuestionario.all
  end

  # GET /cuestionarios/1
  # GET /cuestionarios/1.json
  def show
  end

  # GET /cuestionarios/new
  def new
    @cuestionario = Cuestionario.new
  end

  # GET /cuestionarios/1/edit
  def edit
  end

  # POST /cuestionarios
  # POST /cuestionarios.json
  def create
    @cuestionario = Cuestionario.new(cuestionario_params)

    respond_to do |format|
      if @cuestionario.save
        format.html { redirect_to @cuestionario, notice: 'Cuestionario fue registrado con exito.' }
        format.json { render :show, status: :created, location: @cuestionario }
      else
        format.html { render :new }
        format.json { render json: @cuestionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cuestionarios/1
  # PATCH/PUT /cuestionarios/1.json
  def update
    respond_to do |format|
      if @cuestionario.update(cuestionario_params)
        format.html { redirect_to @cuestionario, notice: 'Cuestionario fue actualizado con exito.' }
        format.json { render :show, status: :ok, location: @cuestionario }
      else
        format.html { render :edit }
        format.json { render json: @cuestionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cuestionarios/1
  # DELETE /cuestionarios/1.json
  def destroy
    @cuestionario.destroy
    respond_to do |format|
      format.html { redirect_to cuestionarios_url, notice: 'Cuestionario fue eliminado con exito.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cuestionario
      @cuestionario = Cuestionario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cuestionario_params
      params.require(:cuestionario).permit(:nombre, 
        :preguntas_attributes => [:id, :contenido,
          :respuestas_attributes => [:id, :contenido, :es_correcta]])
    end
end
