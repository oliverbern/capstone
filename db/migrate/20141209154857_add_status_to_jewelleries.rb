class AddStatusToJewelleries < ActiveRecord::Migration
  def change
    add_column :jewelleries, :listingstatus, :string
    add_column :jewelleries, :killstatus, :boolean
  end
end
