class AddOriginToColorgems < ActiveRecord::Migration
  def change
    add_column :colorgems, :origin, :string
  end
end
