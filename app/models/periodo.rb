class Periodo < ActiveRecord::Base
	has_many :dinosaurios

	validates :nombre, presence: {message: 'Nombre no puede ser vacio'}
end
