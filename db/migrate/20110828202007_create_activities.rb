class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :model_title, :limit => 64
      t.string :model_class, :limit => 32
      t.integer :model_id
      t.integer :model_position
      t.string :action, :limit => 16
      t.string :backup
      t.belongs_to :user
      t.timestamps
    end

    add_index :activities, :user_id
    add_index :activities, :model_class
  end
end

