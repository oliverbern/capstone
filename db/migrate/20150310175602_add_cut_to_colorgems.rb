class AddCutToColorgems < ActiveRecord::Migration
  def change
    add_column :colorgems, :cut, :string
  end
end
