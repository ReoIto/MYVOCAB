class AddExampleToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :example, :text
  end
end
