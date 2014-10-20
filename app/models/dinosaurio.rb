class Dinosaurio < ActiveRecord::Base
	include ActionView::Helpers
	belongs_to :periodo

	has_attached_file :icono, default_url: '/assets/dino-icon.jpg',
		storage: :dropbox, dropbox_credentials: Rails.root.join("config/dropbox.yml")
	validates_attachment :icono,
  		:content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }

	def pathImagen
		self.icono.url
	end

	def descProcesada
		sentence = word_wrap(self.descripcion, line_width: 80)
		sentence.gsub(/\n/, '<br>')
	end
end
