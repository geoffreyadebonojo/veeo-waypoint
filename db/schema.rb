ActiveRecord::Schema.define(version: 2018_12_18_233054) do
  enable_extension "plpgsql"
  create_table "users", force: :cascade do |t|
    t.string "provider"
    t.string "google_id"
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "picture_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
