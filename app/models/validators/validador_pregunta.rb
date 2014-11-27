class ValidadorPregunta < ActiveModel::Validator
	def validate(record)
		cant_correctas = 0
		record.respuestas.each do |respuesta|
			cant_correctas += 1 if respuesta.es_correcta
		end

		record.errors[:respuestas] << "Debe haber solo una respuesta correcta" if cant_correctas != 1
	end
end