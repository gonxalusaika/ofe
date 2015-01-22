class ResultadoRecorrido < ActiveRecord::Base
  belongs_to :recorrido
  has_many :resultado_preguntas

  accepts_nested_attributes_for :resultado_preguntas

  validates :recorrido, presence: true
end