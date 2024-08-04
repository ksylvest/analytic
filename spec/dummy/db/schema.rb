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

ActiveRecord::Schema[7.2].define(version: 2024_08_06_082223) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "analytic_events", force: :cascade do |t|
    t.uuid "visitor_id", null: false
    t.uuid "session_id", null: false
    t.string "path", null: false
    t.string "host", null: false
    t.jsonb "params", default: {}, null: false
    t.datetime "timestamp", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.inet "ip", null: false
    t.string "referrer"
    t.text "user_agent"
    t.index ["timestamp", "session_id"], name: "index_analytic_events_on_timestamp_and_session_id"
    t.index ["timestamp", "visitor_id"], name: "index_analytic_events_on_timestamp_and_visitor_id"
    t.index ["timestamp"], name: "index_analytic_events_on_timestamp"
  end
end
