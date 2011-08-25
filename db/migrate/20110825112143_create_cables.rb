class CreateCables < ActiveRecord::Migration
  def change
    create_table :cables do |t|
      t.string :reference
      t.references :user
      t.string :title

      t.timestamps
    end
    add_index :cables, :user_id
    add_index :cables, :reference
  end
end

