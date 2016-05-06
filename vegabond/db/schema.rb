
ActiveRecord::Schema.define(version: 20160505221318) do
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "born_city"
    t.string   "current_city"
    t.string   "favorite_destination"
    t.string   "bio"
    t.string   "fav_travel_story"
    t.string   "password_digest"
    t.string   "email"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end
