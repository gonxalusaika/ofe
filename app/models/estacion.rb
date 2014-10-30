class Estacion < ActiveRecord::Base
  belongs_to :dinosaurio
  belongs_to :recorrido
  has_and_belongs_to_many :preguntas
end
