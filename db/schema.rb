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

ActiveRecord::Schema.define(version: 20201110013044) do

  create_table "donations", force: :cascade do |t|
    t.string   "product_name"
    t.integer  "product_count"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "price"
  end

  create_table "donations_donors", id: false, force: :cascade do |t|
    t.integer "donation_id", null: false
    t.integer "donor_id",    null: false
    t.boolean "purchased"
    t.index ["donor_id", "donation_id"], name: "index_donations_donors_on_donor_id_and_donation_id"
  end

  create_table "donors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
