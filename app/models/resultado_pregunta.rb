class ResultadoPregunta < ActiveRecord::Base
  belongs_to :pregunta
  belongs_to :respuesta

  belongs_to :resultado_recorrido
  has_one :recorrido, through: :resultado_recorrido
end
