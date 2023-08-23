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

ActiveRecord::Schema.define(version: 2023_08_12_105458) do

  create_table "powers", force: :cascade do |t|
    t.integer "user_id", null: false
    t.float "barbell_bench_press"
    t.float "reverse_push_ups"
    t.float "dumbbell_bench_press"
    t.float "push_ups_on_bars"
    t.float "stacked_chest_press"
    t.float "extension_with_rope_handle"
    t.float "dumbbell_abduction"
    t.float "hanging_leg_raise", default: 0.0
    t.float "austrian_pull_ups", default: 0.0
    t.float "horizontal_pull_block"
    t.float "pull_ups"
    t.float "barbell_forearm_curls"
    t.float "incline_dumbbell_row"
    t.float "vertical_pull_block"
    t.float "hyperextension"
    t.float "hammers"
    t.float "book", default: 0.0
    t.float "gack_squats"
    t.float "seated_leg_extension"
    t.float "leg_press"
    t.float "hamer_shoulder_press"
    t.float "dumbbells_through_the_side"
    t.float "lying_leg_flexion"
    t.float "pancake_swing_in_front_of_you"
    t.float "barbell_pull_to_chin"
    t.integer "monday_reps", default: 8
    t.integer "wednesday_reps", default: 8
    t.integer "friday_reps", default: 8
    t.integer "count_update_training", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_powers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "name"
    t.string "password_digest"
    t.integer "weight"
    t.integer "growth"
    t.integer "years"
    t.string "gender"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "remember_token_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "powers", "users"
end
