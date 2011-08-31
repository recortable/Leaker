class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :model_class, :limit => 32
      t.integer :model_id
      t.string :identifier, :limit => 128
      t.string :action, :limit => 16
      t.string :backup
      t.belongs_to :user
      t.datetime :created_at
    end

    add_index :activities, :user_id
    add_index :activities, :model_id
    add_index :activities, :identifier
  end
end

