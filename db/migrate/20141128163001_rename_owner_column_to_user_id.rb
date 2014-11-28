class RenameOwnerColumnToUserId < ActiveRecord::Migration
  def change
  	rename_column :colorgems, :owner, :user_id
  end
end
