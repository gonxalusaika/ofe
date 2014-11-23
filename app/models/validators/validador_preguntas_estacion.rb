class ValidadorPreguntasEstacion < ActiveModel::Validator
	def validate(record)
		record.preguntas.each do |pregunta|
			record.errors[:base] << "La pregunta #{pregunta.contenido} no esta asociada al dinosaurio" unless record.dinosaurio.id == pregunta.dinosaurio_id
		end
	end
end