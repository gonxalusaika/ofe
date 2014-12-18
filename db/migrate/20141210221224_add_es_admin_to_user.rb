class AddEsAdminToUser < ActiveRecord::Migration
  def change
  	add_column :users, :es_admin, :boolean
  end
end
