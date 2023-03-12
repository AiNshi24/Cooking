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

ActiveRecord::Schema.define(version: 2023_03_12_092102) do

  create_table "book_marks", force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.integer "user_id", null: false
    t.text "comment", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "food_stocks", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name", null: false
    t.text "memo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ingredlents", force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.string "name", null: false
    t.string "quantity", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title", null: false
    t.text "description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tag_relationships", force: :cascade do |t|
    t.integer "tag_id", null: false
    t.integer "recipe_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipe_id"], name: "index_tag_relationships_on_recipe_id"
    t.index ["tag_id"], name: "index_tag_relationships_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "tag_relationships", "recipes"
  add_foreign_key "tag_relationships", "tags"
end
