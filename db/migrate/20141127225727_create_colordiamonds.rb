class CreateColordiamonds < ActiveRecord::Migration
  def change
    create_table :colordiamonds do |t|
      t.decimal :weight
      t.string :color
      t.string :clarity
      t.string :treatment
      t.string :shape
      t.string :condgirdle
      t.string :condculet
      t.string :sizeculet
      t.string :conditioncut
      t.decimal :length
      t.decimal :width
      t.decimal :weight
      t.decimal :height
      t.text :description
      t.string :intensitecolor
      t.string :bycolor1
      t.string :bycolor2
      t.boolean :diamondcertificate

      t.timestamps
    end
  end
end
