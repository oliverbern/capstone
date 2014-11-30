class AddUserIdToDiamonds < ActiveRecord::Migration
  def change
    add_column :diamonds, :user_id, :integer
  end
end
