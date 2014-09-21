class CreatePeriodos < ActiveRecord::Migration
  def change
    create_table :periodos do |t|
      t.string :nombre
      t.text :descripcion

      t.timestamps
    end

    remove_column :dinosaurios, :periodo
    add_reference :dinosaurios, :periodo, index: true
  end
end
