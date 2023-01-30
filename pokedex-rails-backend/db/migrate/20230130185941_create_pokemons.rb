class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.integer :number, null: false
      t.string :name, null: false
      t.integer :attack, null: false
      t.integer :defense, null: false
      t.string :poke_type, null: false
      t.string :image_url, null: false
      t.boolean :captured, null: false, default: false

      t.timestamps
    end
    add_index :pokemons, :number, unique: true
    add_index :pokemons, :name, unique: true
  end
end
