class ValidadorPreguntasEstacion < ActiveModel::Validator
	def validate(record)
		record.preguntas.each do |pregunta|
			record.errors[:base] << "La pregunta #{pregunta.contenido} no está asociada al dinosaurio" unless record.dinosaurio.id == pregunta.dinosaurio_id
		end
	end
end