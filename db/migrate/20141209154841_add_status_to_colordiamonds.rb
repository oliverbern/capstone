class AddStatusToColordiamonds < ActiveRecord::Migration
  def change
    add_column :colordiamonds, :listingstatus, :string
    add_column :colordiamonds, :killstatus, :boolean
  end
end
