class Recorrido < ActiveRecord::Base
  has_many :estacions, :dependent => :delete_all

  accepts_nested_attributes_for :estacions
  validates :nombre, presence: true


  def fecha_creacion
  	self.created_at.strftime('%d/%m/%Y %H:%M')
  end

  def cargar_resultados
  	estacions.each do |estacion|
  		estacion.cargar_resultados
  	end
  end
end
