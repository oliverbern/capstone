class AddOwnerToColorgems < ActiveRecord::Migration
  def change
    add_column :colorgems, :owner, :integer
  end
end
