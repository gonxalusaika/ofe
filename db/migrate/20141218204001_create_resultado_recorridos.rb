class CreateResultadoRecorridos < ActiveRecord::Migration
  def change
    create_table :resultado_recorridos do |t|
      t.references :recorrido, index: true
      t.string :alumno

      t.timestamps
    end

    add_reference :resultado_preguntas, :resultado_recorrido, index: true
  end
end
