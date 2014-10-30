class Api::PreguntasController < ApplicationController
	def index
		@pregunta = Pregunta.all
		respond_to do |format|
			format.json { render json: @pregunta.to_json(include: relaciones_incluye, only: params_exportar)}
			format.xml {render xml: @pregunta.to_xml(include: relaciones_incluye, only: params_exportar)}
		end
	end

	private
		def relaciones_incluye
			{:respuestas => {only: [:id, :contenido]	}}
		end

		def params_exportar
			[:id, :contenido, :dinosaurio_id]
		end
end
