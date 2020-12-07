class AddMeaningToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :meaning, :text
  end
end
