class AddImageToColorgem < ActiveRecord::Migration
  def change
    add_column :colorgems, :image, :string
  end
end
