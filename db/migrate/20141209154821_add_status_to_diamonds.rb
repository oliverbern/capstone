class AddStatusToDiamonds < ActiveRecord::Migration
  def change
    add_column :diamonds, :listingstatus, :string
    add_column :diamonds, :killstatus, :boolean
  end
end
