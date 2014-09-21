class Api::PeriodosController < ApplicationController
	def index
		@periodos = Periodo.all
		respond_to do |format|
			format.json { render json: @periodos.to_json(include: relaciones_incluye, only: params_exportar)}
			format.xml {render xml: @periodos.to_xml(include: relaciones_incluye, only: params_exportar)}
		end
	end

	private
		def relaciones_incluye
			{:dinosaurios => {only: [:nombre, :descripcion]	}}
		end

		def params_exportar
			[:nombre, :descripcion]
		end
end