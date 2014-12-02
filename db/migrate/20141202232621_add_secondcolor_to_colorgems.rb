class AddSecondcolorToColorgems < ActiveRecord::Migration
  def change
    add_column :colorgems, :secondcolor, :string
  end
end
