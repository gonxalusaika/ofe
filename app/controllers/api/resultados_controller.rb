class Api::ResultadosController < ApplicationController
	protect_from_forgery with: :null_session

	def create
		puts params.to_json.yellow
		@resultado = ResultadoRecorrido.new(params_resultado(params))

    if @resultado.save
      render json: @resultado
    else
      render json: @resultado.errors, status: :unprocessable_entity
    end
	end

	def show
		recorrido = Recorrido.find(params[:recorrido_id])
		recorrido.cargar_resultados
		respond_to do |format|
    	format.json { render json: recorrido.to_json(include: relaciones_incluye) }
    	format.xml { render xml: recorrido.to_xml(include: :estacions) }
    end
	end


	private
		def relaciones_incluye
			{:estacions => {
				include: {
					:preguntas => {
						include: {
							:respuestas => {
								only: [:id, :contenido, :es_correcta, :feedback], methods: [:cantidad_elegida]}}, 
						only: [:id, :contenido]}
					},	
				only: [:id, :indice]}}
		end


		def params_resultado params
			params.require(:resultado_recorrido).permit(:recorrido_id, :alumno,
				:resultado_preguntas_attributes => [:id, :pregunta_id, :respuesta_id])
		end
end
