class Descripcion < ActiveRecord::Base
	belongs_to :dinosaurio
	validates :contenido, presence: {message: "La descripcion no puede estar vacia"}, length: {maximum: 325}
end