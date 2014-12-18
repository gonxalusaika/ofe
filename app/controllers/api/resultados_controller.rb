class Api::ResultadosController < ApplicationController
	protect_from_forgery with: :null_session

	def create
		@resultado = ResultadoRecorrido.new(params_resultado(params))

		respond_to do |format|
      if @resultado.save
        format.html { redirect_to @resultado, notice: 'Resultado was successfully created.' }
        format.json { render json: @resultado }
      else
        format.html { render :new }
        format.json { render json: @resultado.errors, status: :unprocessable_entity }
      end
    end
	end


	private
		def params_resultado params
			params.require(:resultado_recorrido).permit(:recorrido_id, :alumno,
				:resultado_preguntas_attributes => [:id, :pregunta_id, :respuesta_id])
		end
end
