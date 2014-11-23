class Respuesta < ActiveRecord::Base
	belongs_to :pregunta

	attr_accessor :cantidad_elegida
end
