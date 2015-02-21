class Respuesta < ActiveRecord::Base
	belongs_to :pregunta

	validates :contenido, presence: true, length: {maximum: 49}
	validates :feedback, presence: true

	attr_accessor :cantidad_elegida
end
