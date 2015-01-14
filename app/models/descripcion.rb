class Descripcion < ActiveRecord::Base
	belongs_to :dinosaurio

	validates :contenido, presence: {message: "La descripción no puede estar vacía"}, length: {maximum: 325}
end
