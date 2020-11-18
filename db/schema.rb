

ActiveRecord::Schema.define(version: 20201116013444) do

  create_table "donations", force: :cascade do |t|
    t.string   "product_name"
    t.integer  "product_count"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "price"
  end

  create_table "donations_donors", id: false, force: :cascade do |t|
    t.integer "donation_id"
    t.integer "donor_id"
    t.boolean "purchased"
    t.integer "count"
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
