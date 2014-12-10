class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :title, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :company, :string
    add_column :users, :street_and_no, :string
    add_column :users, :zip, :string
    add_column :users, :town, :string
    add_column :users, :country, :string
    add_column :users, :phone, :string
    add_column :users, :website, :string
    add_column :users, :vat, :string
  end
end
