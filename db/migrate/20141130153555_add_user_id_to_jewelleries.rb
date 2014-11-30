class AddUserIdToJewelleries < ActiveRecord::Migration
  def change
    add_column :jewelleries, :user_id, :integer
  end
end
