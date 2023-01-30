# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_01_30_204646) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.bigint "pokemon_id", null: false
    t.string "name", null: false
    t.integer "price", null: false
    t.integer "happiness", null: false
    t.string "image_url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pokemon_id"], name: "index_items_on_pokemon_id"
  end

  create_table "moves", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_moves_on_name", unique: true
  end

  create_table "poke_moves", force: :cascade do |t|
    t.bigint "pokemon_id", null: false
    t.bigint "move_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["move_id"], name: "index_poke_moves_on_move_id"
    t.index ["pokemon_id", "move_id"], name: "index_poke_moves_on_pokemon_id_and_move_id", unique: true
  end

  create_table "pokemons", force: :cascade do |t|
    t.integer "number", null: false
    t.string "name", null: false
    t.integer "attack", null: false
    t.integer "defense", null: false
    t.string "poke_type", null: false
    t.string "image_url", null: false
    t.boolean "captured", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_pokemons_on_name", unique: true
    t.index ["number"], name: "index_pokemons_on_number", unique: true
  end

  add_foreign_key "items", "pokemons"
  add_foreign_key "poke_moves", "moves"
  add_foreign_key "poke_moves", "pokemons"
end
