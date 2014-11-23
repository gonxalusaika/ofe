class AddUrlIconoToDinosaurios < ActiveRecord::Migration
  def change
    add_column :dinosaurios, :url_icono, :string
  end
end
