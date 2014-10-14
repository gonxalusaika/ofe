class EstacionesController < ApplicationController
  def index
  	@dinosaurios = Dinosaurio.all
  end
end
