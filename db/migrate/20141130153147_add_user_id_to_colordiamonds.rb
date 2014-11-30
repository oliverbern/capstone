class AddUserIdToColordiamonds < ActiveRecord::Migration
  def change
    add_column :colordiamonds, :user_id, :integer
  end
end
