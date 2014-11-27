class Dinosaurio < ActiveRecord::Base
	include ActionView::Helpers

	belongs_to :periodo
	has_many :preguntas
	has_many :descripciones

	accepts_nested_attributes_for :descripciones

	has_attached_file :icono, default_url: ActionController::Base.helpers.asset_path('dino-icon.jpg'),
		storage: :dropbox, dropbox_credentials: Rails.root.join("config/dropbox.yml")

	validates :nombre, presence: {message: "El nombre no puede ser vacio"}
	validates_attachment :icono,
  		:content_type => { :content_type => [/\Aimage/, /\Avideo/] }

	def pathImagen
		cachear_url_icono if self.url_icono.nil?
		self.url_icono
	end

	def descProcesada
		sentence = word_wrap(self.descripcion, line_width: 80)
		sentence.gsub(/\n/, '<br>')
	end

	def build_descripciones
		descripcion = Descripcion.new
		self.descripciones << descripcion
	end

	private
		def cachear_url_icono
			self.url_icono = self.icono.url unless self.icono.nil?
		end
end
