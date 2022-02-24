ActiveRecord::Schema.define(version: 2017_12_19_160021) do

  enable_extension "hstore"
  enable_extension "plpgsql"

  create_table "analyses", force: :cascade do |t|
    t.string "category"
    t.text "resource"
    t.hstore "results"
    t.string "request_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
