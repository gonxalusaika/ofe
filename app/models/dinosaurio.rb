class Dinosaurio < ActiveRecord::Base
	belongs_to :periodo

	has_attached_file :icono, default_url: 'assets/dino-icon.jpg'
	validates_attachment :icono,
  		:content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }

  	def pathImagen
  		self.icono.url
  	end
end
