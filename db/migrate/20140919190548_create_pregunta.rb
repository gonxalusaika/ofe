class CreatePregunta < ActiveRecord::Migration
  def change
    create_table :pregunta do |t|
      t.string :contenido
      t.references :cuestionario, index: true

      t.timestamps
    end
  end
end
