class Descripcion < ActiveRecord::Base
	belongs_to :dinosaurio


	validates :contenido, presence: {message: "Debe haber una descripcion"}, length: {maximum: 325}
end
