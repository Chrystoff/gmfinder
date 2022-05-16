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

ActiveRecord::Schema[7.0].define(version: 2022_05_16_033635) do
  create_table "gamemasters", force: :cascade do |t|
    t.string "name"
    t.integer "experience"
    t.string "availability"
    t.text "about"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "system"
    t.integer "difficulty"
    t.boolean "mature_content"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "experience"
    t.string "availability"
    t.text "about"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.time "time"
    t.integer "length"
    t.text "description"
    t.integer "game_id", null: false
    t.integer "gamemaster_id", null: false
    t.integer "player_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["game_id"], name: "index_sessions_on_game_id"
    t.index ["gamemaster_id"], name: "index_sessions_on_gamemaster_id"
    t.index ["player_id"], name: "index_sessions_on_player_id"
  end

  add_foreign_key "sessions", "gamemasters"
  add_foreign_key "sessions", "games"
  add_foreign_key "sessions", "players"
end
