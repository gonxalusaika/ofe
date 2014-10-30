class CreatePregunta < ActiveRecord::Migration
  def change
    create_table :preguntas do |t|
      t.string :contenido
      t.references :cuestionario, index: true
      t.references :dinosaurio, index: true

      t.timestamps
    end
  end
end
