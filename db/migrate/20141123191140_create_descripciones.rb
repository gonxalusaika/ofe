class CreateDescripciones < ActiveRecord::Migration
  def change
    create_table :descripciones do |t|
      t.text :contenido
      t.references :dinosaurio, index: true
      t.timestamps
    end

    add_reference :dinosaurios, :descripciones, index: true

    Dinosaurio.find_each do |dinosaurio|
    	descripcion = Descripcion.new(contenido: dinosaurio.descripcion)
    	dinosaurio.descripciones << descripcion
    	dinosaurio.save
    end

    remove_column :dinosaurios, :descripcion, :text

  end
end
