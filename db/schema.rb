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

ActiveRecord::Schema.define(version: 2018_05_21_211005) do

  create_table "moviegoers", force: :cascade do |t|
    t.string "name"
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "roles_mask"
    t.index ["email"], name: "index_moviegoers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_moviegoers_on_reset_password_token", unique: true
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "rating"
    t.text "description"
    t.datetime "release_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "potatoes"
    t.text "comments"
    t.integer "likes"
    t.integer "moviegoer_id"
    t.integer "movie_id"
    t.index ["movie_id"], name: "index_reviews_on_movie_id"
    t.index ["moviegoer_id"], name: "index_reviews_on_moviegoer_id"
  end

end
