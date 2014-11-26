class CreateColorgems < ActiveRecord::Migration
  def change
    create_table :colorgems do |t|
      t.string :gemstonetype
      t.string :color
      t.string :shape
      t.decimal :length
      t.decimal :height
      t.decimal :width
      t.decimal :weight
      t.boolean :gemscertificate

      t.timestamps
    end
  end
end
