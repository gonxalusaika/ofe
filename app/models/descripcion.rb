class Descripcion < ActiveRecord::Base
	belongs_to :dinosaurio
	validates :contenido, presence: true, length: {maximum: 325}
end