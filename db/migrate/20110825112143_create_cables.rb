class CreateCables < ActiveRecord::Migration
  def change
    create_table :cables do |t|
      t.string :identifier
      t.references :user
      t.text :body
      t.string :subject

      t.timestamps
    end
    add_index :cables, :user_id
    add_index :cables, :identifier
  end
end

