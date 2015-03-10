class AddColumnnameToColorgems < ActiveRecord::Migration
  def change
    add_column :colorgems, :internal_sku, :string
    add_column :colorgems, :mandate, :string
  end
end
