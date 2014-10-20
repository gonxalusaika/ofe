class CreateEstacions < ActiveRecord::Migration
  def change
    create_table :estacions do |t|
      t.integer :indice
      t.references :dinosaurio, index: true
      t.references :preguntas, index: true
      t.references :recorrido, index: true

      t.timestamps
    end
  end
end
