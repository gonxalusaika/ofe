class ResultadosController < ApplicationController
	include ApplicationHelper
  before_filter :authenticate
  
	def index
		preparar_resultados
	end

	def show
		# @recorrido = Recorrido.find(params[:recorrido])
		# @recorrido.cargar_resultados
		@id = params[:recorrido]
	end

	private
		def preparar_resultados
			@preguntas = Pregunta.all
			@preguntas.each do |pregunta|
				pregunta.respuestas.each do |respuesta|
					respuesta.cantidad_elegida = ResultadoPregunta.where(respuesta: respuesta).count
				end
			end
		end
end
