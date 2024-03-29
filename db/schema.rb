# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_03_09_055119) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "applies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "team_id"
    t.index ["team_id"], name: "index_applies_on_team_id"
    t.index ["user_id"], name: "index_applies_on_user_id"
  end

  create_table "attends", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "attendance_id", null: false
    t.bigint "user_id"
    t.bigint "calender_id"
    t.index ["calender_id"], name: "index_attends_on_calender_id"
    t.index ["user_id"], name: "index_attends_on_user_id"
  end

  create_table "calenders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title", null: false
    t.text "content", null: false
    t.datetime "start_time", null: false
    t.datetime "end_time", null: false
    t.bigint "user_id"
    t.bigint "team_id"
    t.index ["team_id"], name: "index_calenders_on_team_id"
    t.index ["user_id"], name: "index_calenders_on_user_id"
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "content", null: false
    t.bigint "user_id"
    t.bigint "team_id"
    t.bigint "game_id"
    t.index ["game_id"], name: "index_comments_on_game_id"
    t.index ["team_id"], name: "index_comments_on_team_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "games", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title", null: false
    t.datetime "start_time", null: false
    t.datetime "end_time", null: false
    t.string "place", null: false
    t.text "content", null: false
    t.bigint "user_id"
    t.bigint "team_id"
    t.index ["team_id"], name: "index_games_on_team_id"
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "teams", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "team_name", null: false
    t.string "name", null: false
    t.text "introduction", null: false
    t.integer "area_id", null: false
    t.integer "owner_id", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "user_teams", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "team_id"
    t.index ["team_id"], name: "index_user_teams_on_team_id"
    t.index ["user_id"], name: "index_user_teams_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nickname", null: false
    t.string "surname", null: false
    t.string "name", null: false
    t.string "surnamek", null: false
    t.string "namek", null: false
    t.integer "position_id", null: false
    t.string "play", null: false
    t.date "birthday", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "applies", "teams"
  add_foreign_key "applies", "users"
  add_foreign_key "attends", "calenders"
  add_foreign_key "attends", "users"
  add_foreign_key "calenders", "teams"
  add_foreign_key "calenders", "users"
  add_foreign_key "comments", "games"
  add_foreign_key "comments", "teams"
  add_foreign_key "comments", "users"
  add_foreign_key "games", "teams"
  add_foreign_key "games", "users"
  add_foreign_key "teams", "users"
  add_foreign_key "user_teams", "teams"
  add_foreign_key "user_teams", "users"
end
