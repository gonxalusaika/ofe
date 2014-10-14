class AddAttachmentIconoToDinosaurios < ActiveRecord::Migration
  def self.up
    change_table :dinosaurios do |t|
      t.attachment :icono
    end
  end

  def self.down
    remove_attachment :dinosaurios, :icono
  end
end
