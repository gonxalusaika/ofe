class Estacion < ActiveRecord::Base
  belongs_to :dinosaurio
  belongs_to :recorrido
  has_and_belongs_to_many :preguntas

  validates :dinosaurio, presence: {message: "El dinosaurio no puede ser vacio"}
  validates_with ValidadorEstacion

  	# def coinciden_preguntas_dinosaurio?
  	# 	errores = 0
  	# 	preguntas.each do |pregunta|
  	# 		errores += 1 unless dinosaurio.id == pregunta.dinosaurio_id
  	# 	end
  	# 	errores == 0
  	# end
end