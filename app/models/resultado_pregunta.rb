class ResultadoPregunta < ActiveRecord::Base
  belongs_to :pregunta
  belongs_to :respuesta
end
