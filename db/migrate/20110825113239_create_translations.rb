class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.references :cable
      t.references :user
      t.string :body

      t.timestamps
    end
    add_index :translations, :cable_id
    add_index :translations, :user_id
  end
end
