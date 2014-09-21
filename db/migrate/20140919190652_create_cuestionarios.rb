class CreateCuestionarios < ActiveRecord::Migration
  def change
    create_table :cuestionarios do |t|
      t.string :nombre
      t.references :preguntas, index: true

      t.timestamps
    end
  end
end
