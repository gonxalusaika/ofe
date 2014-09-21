class Cuestionario < ActiveRecord::Base
	has_many :preguntas

	accepts_nested_attributes_for :preguntas
end
