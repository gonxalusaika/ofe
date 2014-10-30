class CreateRespuesta < ActiveRecord::Migration
  def change
    create_table :respuestas do |t|
      t.string :contenido
      t.string :feedback
      t.boolean :es_correcta
      t.references :pregunta, index: true

      t.timestamps
    end
  end
end
