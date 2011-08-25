class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :provider
      t.string :uid
      t.datetime :last_login_at
      t.integer :login_count

      t.timestamps
    end
  end
end
