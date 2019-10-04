# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_03_160717) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "items", force: :cascade do |t|
    t.string "japanese_name"
    t.string "chinese_name"
    t.string "english_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "moves", force: :cascade do |t|
    t.integer "accuracy"
    t.integer "pp"
    t.string "name"
    t.string "power"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "poke_type_id"
    t.string "cname"
    t.string "category"
    t.string "jname"
    t.string "move_type"
    t.index ["poke_type_id"], name: "index_moves_on_poke_type_id"
  end

  create_table "poke_types", force: :cascade do |t|
    t.string "english_name"
    t.string "chinese_name"
    t.string "japanese_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pokemon_types", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "pokemon_id"
    t.bigint "poke_type_id"
    t.index ["poke_type_id"], name: "index_pokemon_types_on_poke_type_id"
    t.index ["pokemon_id"], name: "index_pokemon_types_on_pokemon_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "english_name"
    t.string "japanese_name"
    t.string "chinese_name"
    t.string "french_name"
    t.integer "hp"
    t.integer "attack"
    t.integer "defense"
    t.integer "sp_attack"
    t.integer "sp_defense"
    t.integer "speed"
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "moves", "poke_types"
  add_foreign_key "pokemon_types", "poke_types"
  add_foreign_key "pokemon_types", "pokemons"
end
