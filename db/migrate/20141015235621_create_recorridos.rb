class CreateRecorridos < ActiveRecord::Migration
  def change
    create_table :recorridos do |t|
      t.string :nombre
      t.references :estacions, index: true

      t.timestamps
    end
  end
end
