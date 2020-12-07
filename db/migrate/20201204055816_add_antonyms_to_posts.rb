class AddAntonymsToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :antonyms, :text
  end
end
