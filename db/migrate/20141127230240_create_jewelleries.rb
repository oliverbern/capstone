class CreateJewelleries < ActiveRecord::Migration
  def change
    create_table :jewelleries do |t|
      t.string :title
      t.string :stone1
      t.string :stone2
      t.string :stone3
      t.string :material1
      t.string :material2
      t.string :material3
      t.text :description
      t.boolean :certificate
      t.string :companymade
      t.integer :owner

      t.timestamps
    end
  end
end
