class Periodo < ActiveRecord::Base
	has_many :dinosaurios

	validates :nombre, presence: true
	validates :descripcion, presence: true
end
