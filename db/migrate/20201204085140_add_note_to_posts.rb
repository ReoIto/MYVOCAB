class AddNoteToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :note, :text
  end
end
