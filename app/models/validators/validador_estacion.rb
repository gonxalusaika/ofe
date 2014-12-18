class ValidadorEstacion < ActiveModel::Validator
	def validate(record)
		record.errors[:preguntas] << "Debe haber al menos una pregunta" if record.preguntas.size == 0
		record.errors[:preguntas] << "Debe haber un maximo de 4 preguntas" if record.preguntas.size > 4
		record.preguntas.each do |pregunta|
			record.errors[:base] << "La pregunta #{pregunta.contenido} no esta asociada al dinosaurio" unless record.dinosaurio.id == pregunta.dinosaurio_id
		end
	end
end