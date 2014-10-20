class Api::CuestionariosController < ApplicationController
	
	api :GET, '/cuestionarios', "Lista todos los cuestionarios"
	formats ['json']
	def index
		@cuestionarios = Cuestionario.all
		respond_to do |format|
			format.json { render json: @cuestionarios.to_json(include: relaciones_incluye, only: params_exportar)}
			format.xml {render xml: @cuestionarios.to_xml(include: relaciones_incluye, only: params_exportar)}
		end
	end

	def show
		@cuestionario = Cuestionario.find(params[:id])
		respond_to do |format|
			format.json { render json: @cuestionario.to_json(include: relaciones_incluye, only: params_exportar)}
			format.xml {render xml: @cuestionario.to_xml(include: relaciones_incluye, only: params_exportar)}
		end
	end

	private
		def relaciones_incluye
			{:preguntas => {include: {:respuestas => { only: [:id, :es_correcta, :contenido]}}, only: [:id, :contenido]}}
		end

		def params_exportar
			[:id, :nombre]
		end
end