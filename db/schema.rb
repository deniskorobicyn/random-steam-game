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

ActiveRecord::Schema.define(version: 20170401100751) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_genres", force: :cascade do |t|
    t.integer  "game_id",    null: false
    t.integer  "genre_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id", "genre_id"], name: "game_genres_unique_idx", unique: true, using: :btree
  end

  create_table "games", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "image_url"
    t.string   "steam_appid"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string   "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["description"], name: "genres_unique_descriptions", unique: true, using: :btree
  end

  create_table "user_games", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id", "user_id"], name: "user_games_unique_idx", unique: true, using: :btree
    t.index ["game_id"], name: "index_user_games_on_game_id", using: :btree
    t.index ["user_id"], name: "index_user_games_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "nickname"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "steamid"
    t.index ["provider"], name: "index_users_on_provider", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["steamid"], name: "index_users_on_steamid", using: :btree
  end

  add_foreign_key "game_genres", "games", name: "game_genres_game_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "game_genres", "genres", name: "game_genres_genre_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user_games", "games", name: "user_games_game_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user_games", "users", name: "user_games_user_id_fkey", on_update: :cascade, on_delete: :cascade
end
