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


	private
		def params_resultado params
			params.require(:resultado_recorrido).permit(:recorrido_id, :alumno,
				:resultado_preguntas_attributes => [:id, :pregunta_id, :respuesta_id])
		end
end
