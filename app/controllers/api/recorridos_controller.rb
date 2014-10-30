class Api::RecorridosController < ApplicationController

	api :GET, '/recorridos', 'Retorna la lista de recorridos registrados'
  def index
		@recorridos = Recorrido.all
		respond_to do |format|
			format.json { render json: @recorridos.to_json(include: relaciones_incluye, only: params_exportar)}
			format.xml {render xml: @recorridos.to_xml(include: relaciones_incluye, only: params_exportar)}
		end
	end

	api :GET, "/recorridos/:id", 'Retorna el recorrido correspondiente al id'
	param :id, :number, required: true
	def show
		@recorrido = Recorrido.find(params[:id])
		respond_to do |format|
			format.json { render json: @recorrido.to_json(include: relaciones_incluye, only: params_exportar)}
			format.xml {render xml: @recorrido.to_xml(include: relaciones_incluye, only: params_exportar)}
		end
	end

	api :POST, "/recorridos/new", 'Crea un recorrido nuevo'
	# param :recorrido, Hash, required: true do
	# 	param :nombre, String, required: true
	# 	param :estacions_attributes, Hash, required: true do
	# 		param :indice, :number, required: true
	# 		param :dinosaurio_id, :number, required: true
	# 	end
	# end
	def create
		@recorrido = Recorrido.new(recorrido_params)
		if @recorrido.save
			render json: @recorrido
		else
			render json: @periodo.errors
		end
    # respond_to do |format|
    #   if @periodo.save
    #     format.html { redirect_to @periodo, notice: 'Periodo was successfully created.' }
    #     format.json { render :show, status: :created, location: @periodo }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @periodo.errors, status: :unprocessable_entity }
    #   end
    # end
		# render json: @recorrido
	end

	private
		def relaciones_incluye
			{:estacions => {
				include: {
					:dinosaurio => { only: [:id, :nombre, :descripcion]}, 
					:preguntas => {include: {:respuestas => {only: [:id, :contenido, :es_correcta]}}, only: [:id, :contenido]}
					},	
				only: [:id, :indice]}}
		end

		def params_exportar
			[:id, :nombre]
		end

		def recorrido_params
			params.require(:recorrido).permit(:nombre, 
				:estacions_attributes => 
						[:id, :indice, :dinosaurio_id, {:pregunta_ids => []}]
				)
		end
end
