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

ActiveRecord::Schema.define(version: 2023_12_12_143713) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "crossfits", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.float "front_squat"
    t.float "hang_grab"
    t.float "overhead_press"
    t.float "kettlebell_swing"
    t.float "kettlebell_pull_to_the_chin"
    t.float "burpee", default: 0.0
    t.float "sitap", default: 0.0
    t.float "russian_twist"
    t.float "plank_with_kettlebell_pull"
    t.float "trusters"
    t.float "bent_over_barbell_pull"
    t.float "deadlift"
    t.float "mahi_dumbbells_through_the_sides"
    t.float "dumbbell_layout"
    t.float "barbell_pull_to_chin"
    t.float "jumping_on_the_pedestal", default: 0.0
    t.float "leg_raises_to_the_bar", default: 0.0
    t.float "riveting", default: 0.0
    t.float "forearm_curls_and_press_ups_with_a_barbell"
    t.float "cross_over"
    t.float "abduction_in_a_butterfly"
    t.float "lying_leg_flexion"
    t.float "seated_leg_extension"
    t.float "jumping_lunges", default: 0.0
    t.float "sumo_squats"
    t.float "farm_walk"
    t.integer "count_update_training", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_crossfits_on_user_id"
  end

  create_table "gains", force: :cascade do |t|
    t.bigint "user_id", null: false
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
    t.float "front_squat"
    t.float "hang_grab"
    t.float "overhead_press"
    t.float "kettlebell_swing"
    t.float "kettlebell_pull_to_the_chin"
    t.float "burpee", default: 0.0
    t.float "sitap", default: 0.0
    t.float "russian_twist"
    t.float "plank_with_kettlebell_pull"
    t.float "trusters"
    t.float "bent_over_barbell_pull"
    t.float "deadlift"
    t.float "dumbbell_layout"
    t.float "jumping_on_the_pedestal", default: 0.0
    t.float "leg_raises_to_the_bar", default: 0.0
    t.float "riveting", default: 0.0
    t.float "forearm_curls_and_press_ups_with_a_barbell"
    t.float "cross_over"
    t.float "abduction_in_a_butterfly"
    t.float "jumping_lunges", default: 0.0
    t.float "sumo_squats"
    t.float "farm_walk"
    t.float "touching_the_heels", default: 0.0
    t.float "running_in_place", default: 0.0
    t.float "statics_in_the_squat", default: 0.0
    t.float "incline_dumbbell_mahi"
    t.float "plank", default: 0.0
    t.float "pushups", default: 0.0
    t.float "reverse_plank", default: 0.0
    t.float "skating", default: 0.0
    t.float "jumping_jack", default: 0.0
    t.float "jump_rope", default: 0.0
    t.float "plank_touch", default: 0.0
    t.float "side_climber", default: 0.0
    t.float "push_ups_with_narrow_arms", default: 0.0
    t.float "squats", default: 0.0
    t.float "plank_reversals", default: 0.0
    t.float "rope_strikes", default: 0.0
    t.float "jumping_out", default: 0.0
    t.float "track", default: 4.5
    t.float "trapeze_in_smith"
    t.float "lifting_dumbbells_in_scott"
    t.float "biceps_sitting"
    t.float "hull_reversals"
    t.float "standing_dumbbell_french_press"
    t.integer "monday_tabat_reps", default: 30
    t.integer "wednesday_tabat_reps", default: 30
    t.integer "friday_tabat_reps", default: 30
    t.integer "monday_tabat_sets", default: 4
    t.integer "wednesday_tabat_sets", default: 4
    t.integer "friday_tabat_sets", default: 4
    t.integer "monday_reps", default: 8
    t.integer "wednesday_reps", default: 8
    t.integer "friday_reps", default: 8
    t.integer "count_update_training", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_gains_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "title"
    t.date "date", default: "2023-12-15"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "powers", force: :cascade do |t|
    t.bigint "user_id", null: false
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

  create_table "tabats", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.float "burpee", default: 0.0
    t.float "touching_the_heels", default: 0.0
    t.float "running_in_place", default: 0.0
    t.float "statics_in_the_squat", default: 0.0
    t.float "mahi_dumbbells_through_the_sides"
    t.float "incline_dumbbell_mahi"
    t.float "sitap", default: 0.0
    t.float "plank", default: 0.0
    t.float "pushups", default: 0.0
    t.float "reverse_plank", default: 0.0
    t.float "skating", default: 0.0
    t.float "jumping_jack", default: 0.0
    t.float "jump_rope", default: 0.0
    t.float "plank_touch", default: 0.0
    t.float "trusters"
    t.float "kettlebell_swing"
    t.float "side_climber", default: 0.0
    t.float "barbell_forearm_curl"
    t.float "push_ups_with_narrow_arms", default: 0.0
    t.float "squats", default: 0.0
    t.float "plank_reversals", default: 0.0
    t.integer "monday_reps", default: 30
    t.integer "wednesday_reps", default: 30
    t.integer "friday_reps", default: 30
    t.integer "monday_sets", default: 4
    t.integer "wednesday_sets", default: 4
    t.integer "friday_sets", default: 4
    t.integer "count_update_training", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_tabats_on_user_id"
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
    t.integer "role", default: 0, null: false
    t.string "password_reset_token"
    t.datetime "password_reset_token_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["password_reset_token"], name: "index_users_on_password_reset_token"
    t.index ["role"], name: "index_users_on_role"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "crossfits", "users"
  add_foreign_key "gains", "users"
  add_foreign_key "photos", "users"
  add_foreign_key "powers", "users"
  add_foreign_key "tabats", "users"
end
