class Recorrido < ActiveRecord::Base
  has_many :estacions, :dependent => :delete_all

  accepts_nested_attributes_for :estacions
  validates :nombre, presence: {message: "No puede ser vacio"}


  def fecha_creacion
  	self.created_at.strftime('%d/%m/%Y %H:%M')
  end
end
