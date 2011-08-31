class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :user
      t.integer :paragraph_id
      t.string :identifier, :limit => 128
      t.string :body, :limit => 384
      t.timestamps
    end

    add_index :comments, :identifier
    add_index :comments, :user_id
  end
end

