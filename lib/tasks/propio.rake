namespace :propio do
  desc "TODO"
  task cargar_feedbacks: :environment do
  	Respuesta.all.each do |respuesta|
  		respuesta.feedback = "Feedback de #{respuesta.contenido}" if respuesta.feedback.nil? or respuesta.feedback.size == 0
  		respuesta.save
  	end
  end

end
