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

ActiveRecord::Schema.define(version: 20170226222834) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auditoria", force: :cascade do |t|
    t.text     "title"
    t.integer  "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.text     "title"
    t.text     "rating"
    t.text     "genre"
    t.text     "image_url"
    t.integer  "minutes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "showtimes", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "auditorium_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.decimal  "price"
    t.integer  "tickets_available"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["auditorium_id"], name: "index_showtimes_on_auditorium_id", using: :btree
    t.index ["movie_id"], name: "index_showtimes_on_movie_id", using: :btree
  end

  add_foreign_key "showtimes", "auditoria"
  add_foreign_key "showtimes", "movies"
end
