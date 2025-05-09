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

ActiveRecord::Schema[7.2].define(version: 2025_05_09_051126) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "starttime"
    t.datetime "endtime"
    t.bigint "host_id", null: false
    t.bigint "venue_id", null: false
    t.bigint "genre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_events_on_genre_id"
    t.index ["host_id"], name: "index_events_on_host_id"
    t.index ["venue_id"], name: "index_events_on_venue_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.integer "genre_type"
    t.text "description"
    t.integer "event_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hosts", force: :cascade do |t|
    t.text "bio"
    t.string "organisation"
    t.string "website"
    t.string "number"
    t.string "string"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participants", force: :cascade do |t|
    t.string "name"
    t.text "interest"
    t.string "city"
    t.date "birthdate"
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "registration_id", null: false
    t.decimal "amount"
    t.string "status"
    t.string "method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["registration_id"], name: "index_payments_on_registration_id"
  end

  create_table "registrations", force: :cascade do |t|
    t.bigint "participant_id", null: false
    t.bigint "event_id", null: false
    t.string "status"
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_registrations_on_event_id"
    t.index ["participant_id"], name: "index_registrations_on_participant_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "reviewable_id"
    t.string "reviewable_type"
    t.bigint "participant_id", null: false
    t.integer "rating"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_id"], name: "index_reviews_on_participant_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.bigint "registration_id", null: false
    t.string "ticket_code"
    t.datetime "issued_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["registration_id"], name: "index_tickets_on_registration_id"
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "capacity"
    t.text "description"
    t.integer "event_count"
    t.integer "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
  end

  add_foreign_key "events", "genres"
  add_foreign_key "events", "hosts"
  add_foreign_key "events", "venues"
  add_foreign_key "payments", "registrations"
  add_foreign_key "registrations", "events"
  add_foreign_key "registrations", "participants"
  add_foreign_key "reviews", "participants"
  add_foreign_key "tickets", "registrations"
end
