class Recorrido < ActiveRecord::Base
  has_many :estacions

  accepts_nested_attributes_for :estacions
end
