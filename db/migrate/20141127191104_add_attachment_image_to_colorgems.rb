class AddAttachmentImageToColorgems < ActiveRecord::Migration
  def self.up
    change_table :colorgems do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :colorgems, :image
  end
end
