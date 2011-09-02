class AddMoreInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rol, :string, :limit => 8
    add_column :users, :email, :string, :limit => 100
    add_column :users, :info_public, :boolean
    add_column :users, :notifications, :string, :limit => 8
  end
end

