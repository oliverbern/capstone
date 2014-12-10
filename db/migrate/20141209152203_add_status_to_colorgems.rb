class AddStatusToColorgems < ActiveRecord::Migration
  def change
    add_column :colorgems, :listingstatus, :integer, :default => 0
    add_column :colorgems, :killstatus, :boolean
  end
end
