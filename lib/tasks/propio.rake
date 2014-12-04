namespace :propio do
  desc "TODO"
  task cargar_feedbacks: :environment do
  	Respuesta.all.each do |respuesta|
  		respuesta.feedback = "Feedback de #{respuesta.contenido}" if respuesta.feedback.nil?
  		respuesta.save
  	end
  end

end
