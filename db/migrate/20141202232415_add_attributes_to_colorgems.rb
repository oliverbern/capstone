class AddAttributesToColorgems < ActiveRecord::Migration
  def change
    add_column :colorgems, :colorbrightness, :string
    add_column :colorgems, :transparency, :string
    add_column :colorgems, :clarity, :string
    add_column :colorgems, :treatment, :string
    add_column :colorgems, :gemsunit, :string
    add_column :colorgems, :colorgemrequested, :boolean
    add_column :colorgems, :colorgemsold, :boolean
    add_column :colorgems, :showprice, :boolean
    add_column :colorgems, :price, :decimal
  end
end
