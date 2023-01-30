class Change < ActiveRecord::Migration[7.0]
  def change
    remove_index :items, column: :name
  end
end
