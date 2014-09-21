class DinosauriosController < ApplicationController
  before_action :set_dinosaurio, only: [:show, :edit, :update, :destroy]

  # GET /dinosaurios
  # GET /dinosaurios.json
  def index
    @dinosaurios = Dinosaurio.all
  end

  # GET /dinosaurios/1
  # GET /dinosaurios/1.json
  def show
  end

  # GET /dinosaurios/new
  def new
    @dinosaurio = Dinosaurio.new
  end

  # GET /dinosaurios/1/edit
  def edit
  end

  # POST /dinosaurios
  # POST /dinosaurios.json
  def create
    @dinosaurio = Dinosaurio.new(dinosaurio_params)

    respond_to do |format|
      if @dinosaurio.save
        format.html { redirect_to @dinosaurio, notice: 'Dinosaurio was successfully created.' }
        format.json { render :show, status: :created, location: @dinosaurio }
      else
        format.html { render :new }
        format.json { render json: @dinosaurio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dinosaurios/1
  # PATCH/PUT /dinosaurios/1.json
  def update
    respond_to do |format|
      if @dinosaurio.update(dinosaurio_params)
        format.html { redirect_to @dinosaurio, notice: 'Dinosaurio was successfully updated.' }
        format.json { render :show, status: :ok, location: @dinosaurio }
      else
        format.html { render :edit }
        format.json { render json: @dinosaurio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dinosaurios/1
  # DELETE /dinosaurios/1.json
  def destroy
    @dinosaurio.destroy
    respond_to do |format|
      format.html { redirect_to dinosaurios_url, notice: 'Dinosaurio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dinosaurio
      @dinosaurio = Dinosaurio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dinosaurio_params
      params.require(:dinosaurio).permit(:nombre, :descripcion, :periodo_id)
    end
end
