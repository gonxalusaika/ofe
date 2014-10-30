class EstacionsPregunta < ActiveRecord::Migration
  def change
  	create_table :estacions_preguntas do |t|
      t.belongs_to :estacion
      t.belongs_to :pregunta
    end
  end
end
