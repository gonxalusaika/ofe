class Api::DinosauriosController < ApplicationController

	api :GET, '/dinosaurios', 'Lista todos los dinosaurios'
	def index
		@dinosaurios = Dinosaurio.all
		respond_to do |format|
		    format.json { 
		    	json = @dinosaurios.to_json(only: [:id, :nombre, :descripcion], methods: [:descProcesada, :pathImagen])
		    	json.gsub!(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")}
		    	render json:  json
		    }
		    format.xml { render xml: @dinosaurios }
	    end
	end

	def show
		@dinosaurio = Dinosaurio.find_by_id(params[:id])
	    respond_to do |format|
	    	format.json { render json: @dinosaurio }
	    	format.xml { render xml: @dinosaurio }
	    end
	end
end