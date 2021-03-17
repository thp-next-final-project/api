# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_17_133021) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "equipements", force: :cascade do |t|
    t.string "name"
    t.integer "weight"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "exercices", force: :cascade do |t|
    t.string "name"
    t.string "categorie"
    t.integer "cal"
    t.text "description"
    t.bigint "equipement_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["equipement_id"], name: "index_exercices_on_equipement_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.integer "cal_per_something"
    t.integer "quantity"
    t.integer "weight"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "jointure_ingredients", force: :cascade do |t|
    t.bigint "ingredient_id"
    t.bigint "meal_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ingredient_id"], name: "index_jointure_ingredients_on_ingredient_id"
    t.index ["meal_id"], name: "index_jointure_ingredients_on_meal_id"
  end

  create_table "jointure_meals", force: :cascade do |t|
    t.bigint "meal_id"
    t.bigint "mod_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["meal_id"], name: "index_jointure_meals_on_meal_id"
    t.index ["mod_id"], name: "index_jointure_meals_on_mod_id"
  end

  create_table "jointure_wod_exercices", force: :cascade do |t|
    t.bigint "wod_id"
    t.bigint "exercice_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exercice_id"], name: "index_jointure_wod_exercices_on_exercice_id"
    t.index ["wod_id"], name: "index_jointure_wod_exercices_on_wod_id"
  end

  create_table "jwt_denylists", force: :cascade do |t|
    t.string "jti"
    t.datetime "expired_at"
    t.index ["jti"], name: "index_jwt_denylists_on_jti"
  end

  create_table "meals", force: :cascade do |t|
    t.integer "calorie"
    t.string "name"
    t.string "title", default: "breakfast"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mods", force: :cascade do |t|
    t.integer "calorie"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "my_equipements", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "equipement_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["equipement_id"], name: "index_my_equipements_on_equipement_id"
    t.index ["user_id"], name: "index_my_equipements_on_user_id"
  end

  create_table "my_performances", force: :cascade do |t|
    t.integer "repetitions"
    t.integer "weight"
    t.bigint "user_id"
    t.bigint "exercice_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exercice_id"], name: "index_my_performances_on_exercice_id"
    t.index ["user_id"], name: "index_my_performances_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "firstname", default: "", null: false
    t.string "lastname", default: "", null: false
    t.integer "age", default: 25, null: false
    t.string "role", default: "user", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wods", force: :cascade do |t|
    t.integer "cal"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
