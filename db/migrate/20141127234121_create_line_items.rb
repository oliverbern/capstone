class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :colorgem, index: true
      t.references :colordiamonds, index: true
      t.references :diamonds, index: true
      t.references :jewellery, index: true
      t.belongs_to :cart, index: true

      t.timestamps
    end
  end
end
