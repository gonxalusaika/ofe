class Api::DinosauriosController < ApplicationController
	def index
		@dinosaurios = Dinosaurio.all
		respond_to do |format|
		    format.json { render json: @dinosaurios.to_json(only: [:id, :nombre, :descripcion], :methods => :pathImagen) }
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