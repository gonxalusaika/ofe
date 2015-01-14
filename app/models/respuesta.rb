class Respuesta < ActiveRecord::Base
	belongs_to :pregunta

	validates :contenido, presence: {message: "La respuesta debe tener un contenido."}, length: {maximum: 49}
	validates :feedback, presence: {message: "La respuesta debe tener un feedback."}

	attr_accessor :cantidad_elegida
end
