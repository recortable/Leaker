class AddTranslationInfo < ActiveRecord::Migration
  def up
    add_column :translations, :summary, :string, :limit => 512
    add_column :translations, :accuracy, :string, :limit => 8
  end

  def down
    remove_column :translations, :summary
    remove_column :translations, :accuracy
  end
end

