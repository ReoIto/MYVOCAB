class AddSynonymsToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :synonyms, :text
  end
end
