class CreateDinosaurios < ActiveRecord::Migration
  def change
    create_table :dinosaurios do |t|
      t.string :nombre
      t.text :descripcion
      t.string :periodo

      t.timestamps
    end
  end
end
