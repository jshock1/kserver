# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150304200702) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "colors", force: :cascade do |t|
    t.integer  "product_id"
    t.text     "name"
    t.text     "code"
    t.text     "hex_color_val"
    t.text     "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "colors", ["product_id"], name: "index_colors_on_product_id", using: :btree

  create_table "custom_product_sets", force: :cascade do |t|
    t.integer  "look_id",                null: false
    t.text     "skin_color",             null: false
    t.integer  "user_id"
    t.integer  "default_product_set_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "custom_product_sets", ["default_product_set_id"], name: "index_custom_product_sets_on_default_product_set_id", using: :btree
  add_index "custom_product_sets", ["look_id"], name: "index_custom_product_sets_on_look_id", using: :btree
  add_index "custom_product_sets", ["skin_color"], name: "index_custom_product_sets_on_skin_color", using: :btree
  add_index "custom_product_sets", ["user_id"], name: "index_custom_product_sets_on_user_id", using: :btree

  create_table "face_map_steps", force: :cascade do |t|
    t.integer  "number"
    t.text     "description"
    t.integer  "face_map_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "face_map_steps", ["face_map_id"], name: "index_face_map_steps_on_face_map_id", using: :btree

  create_table "face_maps", force: :cascade do |t|
    t.integer  "look_id"
    t.integer  "image_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "face_maps", ["image_id"], name: "index_face_maps_on_image_id", using: :btree
  add_index "face_maps", ["look_id"], name: "index_face_maps_on_look_id", using: :btree
  add_index "face_maps", ["user_id"], name: "index_face_maps_on_user_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.text     "name"
    t.text     "filename"
    t.text     "dir"
    t.text     "page"
    t.text     "template"
    t.text     "group"
    t.text     "model"
    t.text     "role"
    t.text     "description"
    t.text     "file_type"
    t.text     "code"
    t.integer  "user_id"
    t.text     "state"
    t.text     "active"
    t.integer  "file_size"
    t.integer  "width"
    t.integer  "height"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images", ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id", using: :btree
  add_index "images", ["user_id"], name: "index_images_on_user_id", using: :btree

  create_table "look_reviews", force: :cascade do |t|
    t.text     "title"
    t.integer  "rating"
    t.boolean  "recommended"
    t.boolean  "use_again"
    t.text     "review"
    t.integer  "look_id"
    t.integer  "user_id"
    t.text     "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "look_reviews", ["look_id"], name: "index_look_reviews_on_look_id", using: :btree
  add_index "look_reviews", ["user_id"], name: "index_look_reviews_on_user_id", using: :btree

  create_table "looks", force: :cascade do |t|
    t.text     "title"
    t.text     "code"
    t.text     "short_desc"
    t.text     "desc"
    t.text     "usage_directions"
    t.float    "avg_rating",         default: 0.0, null: false
    t.integer  "user_id"
    t.text     "state"
    t.integer  "look_reviews_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "looks", ["user_id"], name: "index_looks_on_user_id", using: :btree

  create_table "product_apps", force: :cascade do |t|
    t.string   "role",       null: false
    t.string   "subrole"
    t.integer  "product_id", null: false
    t.integer  "user_id"
    t.integer  "color_id"
    t.string   "category",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_apps", ["category"], name: "index_product_apps_on_category", using: :btree
  add_index "product_apps", ["color_id"], name: "index_product_apps_on_color_id", using: :btree
  add_index "product_apps", ["product_id"], name: "index_product_apps_on_product_id", using: :btree
  add_index "product_apps", ["role"], name: "index_product_apps_on_role", using: :btree
  add_index "product_apps", ["user_id"], name: "index_product_apps_on_user_id", using: :btree

  create_table "product_clusters", force: :cascade do |t|
    t.text     "category",       null: false
    t.text     "role",           null: false
    t.string   "subrole"
    t.integer  "use_order"
    t.integer  "user_id"
    t.integer  "product_set_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_clusters", ["category"], name: "index_product_clusters_on_category", using: :btree
  add_index "product_clusters", ["product_set_id"], name: "index_product_clusters_on_product_set_id", using: :btree
  add_index "product_clusters", ["role"], name: "index_product_clusters_on_role", using: :btree
  add_index "product_clusters", ["user_id"], name: "index_product_clusters_on_user_id", using: :btree

  create_table "product_recommendations", force: :cascade do |t|
    t.integer  "product_cluster_id",              null: false
    t.integer  "product_app_id",                  null: false
    t.integer  "priority",           default: 50, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_recommendations", ["product_app_id"], name: "index_product_recommendations_on_product_app_id", using: :btree
  add_index "product_recommendations", ["product_cluster_id"], name: "index_product_recommendations_on_product_cluster_id", using: :btree

  create_table "product_reviews", force: :cascade do |t|
    t.text     "title",       null: false
    t.integer  "rating"
    t.boolean  "recommended"
    t.boolean  "use_again"
    t.text     "review"
    t.integer  "product_id"
    t.integer  "user_id"
    t.text     "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_reviews", ["product_id"], name: "index_product_reviews_on_product_id", using: :btree
  add_index "product_reviews", ["rating"], name: "index_product_reviews_on_rating", using: :btree
  add_index "product_reviews", ["recommended"], name: "index_product_reviews_on_recommended", using: :btree
  add_index "product_reviews", ["state"], name: "index_product_reviews_on_state", using: :btree
  add_index "product_reviews", ["use_again"], name: "index_product_reviews_on_use_again", using: :btree
  add_index "product_reviews", ["user_id"], name: "index_product_reviews_on_user_id", using: :btree

  create_table "product_sets", force: :cascade do |t|
    t.integer  "look_id",    null: false
    t.text     "skin_color", null: false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_sets", ["look_id"], name: "index_product_sets_on_look_id", using: :btree
  add_index "product_sets", ["skin_color"], name: "index_product_sets_on_skin_color", using: :btree
  add_index "product_sets", ["user_id"], name: "index_product_sets_on_user_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.text     "sku",                                   null: false
    t.text     "brand"
    t.text     "line"
    t.text     "name"
    t.text     "code"
    t.text     "short_desc"
    t.text     "desc"
    t.text     "size"
    t.text     "manufacturer_sku"
    t.text     "state"
    t.boolean  "is_multicolor",         default: false
    t.float    "avg_rating",            default: 0.0,   null: false
    t.integer  "price_cents",           default: 0,     null: false
    t.integer  "cost_cents"
    t.integer  "product_reviews_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["brand"], name: "index_products_on_brand", using: :btree
  add_index "products", ["line"], name: "index_products_on_line", using: :btree
  add_index "products", ["name"], name: "index_products_on_name", using: :btree
  add_index "products", ["sku"], name: "index_products_on_sku", using: :btree
  add_index "products", ["state"], name: "index_products_on_state", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.text     "first_name"
    t.text     "last_name"
    t.text     "email"
    t.text     "street1"
    t.text     "street2"
    t.text     "city"
    t.text     "state"
    t.text     "postal_code"
    t.boolean  "receive_emails", default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "source"
    t.integer  "user_id"
    t.string   "skin_color"
    t.string   "eye_color"
    t.string   "hair_color"
    t.string   "age"
    t.string   "skin_type"
    t.string   "screen_name"
  end

  add_index "profiles", ["email"], name: "index_profiles_on_email", unique: true, using: :btree
  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.text     "email",                  default: "", null: false
    t.text     "encrypted_password",     default: "", null: false
    t.text     "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.text     "current_sign_in_ip"
    t.text     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "videos", force: :cascade do |t|
    t.text     "name"
    t.text     "filename"
    t.text     "dir"
    t.text     "page"
    t.text     "template"
    t.text     "group"
    t.text     "model"
    t.text     "role"
    t.text     "description"
    t.text     "storage_site"
    t.text     "code"
    t.integer  "size"
    t.time     "duration"
    t.text     "url"
    t.text     "file_type"
    t.integer  "user_id"
    t.text     "status"
    t.integer  "videoable_id"
    t.string   "videoable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "videos", ["user_id"], name: "index_videos_on_user_id", using: :btree
  add_index "videos", ["videoable_type", "videoable_id"], name: "index_videos_on_videoable_type_and_videoable_id", using: :btree

end
