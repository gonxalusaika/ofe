class Dinosaurio < ActiveRecord::Base
	include ActionView::Helpers

	belongs_to :periodo
	has_many :preguntas

	has_attached_file :icono, default_url: ActionController::Base.helpers.asset_path('dino-icon.jpg'),
		storage: :dropbox, dropbox_credentials: Rails.root.join("config/dropbox.yml")

	validates :nombre, presence: {message: "El nombre no puede ser vacio"}
	validates :descripcion, presence: {message: "Debe haber una descripcion"}
	validates_attachment :icono,
  		:content_type => { :content_type => ["image/jpeg", "image/gif", "image/png", /\Avideo/] }

	def pathImagen
		self.icono.url unless self.icono.nil?
	end

	def descProcesada
		sentence = word_wrap(self.descripcion, line_width: 80)
		sentence.gsub(/\n/, '<br>')
	end
end
