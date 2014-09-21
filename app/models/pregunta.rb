class Pregunta < ActiveRecord::Base
	belongs_to :cuestionario
	has_many :respuestas

	accepts_nested_attributes_for :respuestas

	def build_respuestas
  	4.times do
  		@respuesta = Respuesta.new
  		self.respuestas << @respuesta
  	end
  end
end
