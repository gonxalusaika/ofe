class Respuesta < ActiveRecord::Base
	belongs_to :pregunta

	validates :contenido, presence: true, length: {maximum: 60}
	validates :feedback, presence: true

	attr_accessor :cantidad_elegida
end
