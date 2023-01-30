class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :pokemon, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :price, null: false
      t.integer :happiness, null: false
      t.string :image_url, null: false
      t.timestamps
    end
    add_index :items, :name, unique: true
  end
end
