class CreateRespuesta < ActiveRecord::Migration
  def change
    create_table :respuesta do |t|
      t.string :contenido
      t.boolean :es_correcta
      t.references :pregunta, index: true

      t.timestamps
    end
  end
end
