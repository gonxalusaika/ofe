class Pregunta < ActiveRecord::Base
	self.table_name = "preguntas"
	belongs_to :cuestionario
	has_many :respuestas
	has_and_belongs_to_many :estacions
	belongs_to :dinosaurio

	accepts_nested_attributes_for :respuestas

	def build_respuestas
  	4.times do
  		@respuesta = Respuesta.new
  		self.respuestas << @respuesta
  	end
  end
end
