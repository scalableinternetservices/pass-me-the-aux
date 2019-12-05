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

ActiveRecord::Schema.define(version: 2019_12_04_192727) do

  create_table "recommendations", force: :cascade do |t|
    t.string "requestor_name"
    t.string "requestor_id"
    t.string "url_to_song"
    t.string "recommender_name"
    t.string "recommender_id"
    t.integer "verdict"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["requestor_id", "url_to_song", "recommender_id", "verdict"], name: "index_recommendations"
    t.index ["requestor_id"], name: "index_recommendations_on_requestor_id"
  end

  create_table "scores", force: :cascade do |t|
    t.string "user_id"
    t.integer "score"
    t.string "user_name"
    t.index ["score", "user_id", "user_name"], name: "index_scores_on_score_and_user_id_and_user_name"
    t.index ["user_id"], name: "index_scores_on_user_id"
  end

  create_table "users", id: false, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "role"
    t.string "id"
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["id"], name: "index_users_on_id"
    t.index ["name", "email", "role", "id"], name: "index_users_on_name_and_email_and_role_and_id"
  end

end
