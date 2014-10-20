class Estacion < ActiveRecord::Base
  belongs_to :dinosaurio
  belongs_to :recorrido
  has_many :preguntas
end
