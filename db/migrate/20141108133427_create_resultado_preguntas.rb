class CreateResultadoPreguntas < ActiveRecord::Migration
  def change
    create_table :resultado_preguntas do |t|
      t.references :pregunta, index: true
      t.references :respuesta, index: true

      t.timestamps
    end
  end
end
