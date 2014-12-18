class ResultadoPregunta < ActiveRecord::Base
  belongs_to :pregunta
  belongs_to :respuesta

  belongs_to :resultado_recorridos
end
