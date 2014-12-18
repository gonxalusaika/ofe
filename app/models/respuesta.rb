class Respuesta < ActiveRecord::Base
	belongs_to :pregunta

	validates :contenido, presence: {message: "No puede ser vacio"}, length: {maximum: 49}
	validates :feedback, presence: {message: "No puede ser vacio"}

	attr_accessor :cantidad_elegida
end
