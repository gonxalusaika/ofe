class Recorrido < ActiveRecord::Base
  has_many :estacions, :dependent => :delete_all

  accepts_nested_attributes_for :estacions
end
