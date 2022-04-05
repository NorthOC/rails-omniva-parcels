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

ActiveRecord::Schema.define(version: 2022_04_05_174638) do

  create_table "machines", force: :cascade do |t|
    t.string "ZIP"
    t.string "NAME"
    t.string "TYPE"
    t.string "A0_NAME"
    t.string "A1_NAME"
    t.string "A2_NAME"
    t.string "A3_NAME"
    t.string "A4_NAME"
    t.string "A5_NAME"
    t.string "A6_NAME"
    t.string "A7_NAME"
    t.string "A8_NAME"
    t.string "X_COORDINATE"
    t.string "Y_COORDINATE"
    t.string "SERVICE_HOURS"
    t.string "TEMP_SERVICE_HOURS"
    t.string "TEMP_SERVICE_HOURS_UNTIL"
    t.string "TEMP_SERVICE_HOURS_2"
    t.string "TEMP_SERVICE_HOURS_2_UNTIL"
    t.string "comment_est"
    t.string "comment_eng"
    t.string "comment_rus"
    t.string "comment_lav"
    t.string "comment_lit"
    t.string "MODIFIED"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
