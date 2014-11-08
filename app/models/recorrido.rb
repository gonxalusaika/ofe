class Recorrido < ActiveRecord::Base
  has_many :estacions, :dependent => :delete_all

  accepts_nested_attributes_for :estacions


  def fecha_creacion
  	self.created_at.strftime('%d/%m/%Y %H:%M')
  end
end
