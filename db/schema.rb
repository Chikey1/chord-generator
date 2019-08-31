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

ActiveRecord::Schema.define(version: 20190831050636) do

  create_table "numerical_chords", force: :cascade do |t|
    t.integer "chord_base_id", null: false
    t.text "modification_ids", null: false
    t.integer "base", null: false
    t.string "quality", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["base"], name: "index_numerical_chords_on_base"
    t.index ["quality", "base"], name: "index_numerical_chords_on_quality_and_base"
  end

end
