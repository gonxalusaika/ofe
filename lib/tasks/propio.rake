namespace :propio do
  desc "TODO"
  task cargar_feedbacks: :environment do
  	Respuesta.all.each do |respuesta|
  		respuesta.feedback = "Feedback de #{respuesta.contenido}" if respuesta.feedback.nil? or respuesta.feedback.size == 0
  		respuesta.save
  	end
  end

  task generar_resultados: :environment do
  	recorrido = Recorrido.find(1)
  	200.times do
  		
  		resultado = ResultadoRecorrido.new(recorrido: recorrido, alumno: 'trucho')
	  	recorrido.estacions.each do |estacion|
	  		estacion.preguntas.each do |pregunta|
	  			resultado.resultado_preguntas << ResultadoPregunta.new(pregunta: pregunta, respuesta: pregunta.respuestas[rand(0..3)])
	  		end
	  	end
	  	resultado.save
	  end
  end

end
