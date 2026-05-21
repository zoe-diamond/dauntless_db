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

ActiveRecord::Schema[7.1].define(version: 2018_07_05_201414) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "armors", force: :cascade do |t|
    t.string "name"
    t.integer "cell_slot_type"
    t.integer "base_armor"
    t.integer "elemental_resistance_amount"
    t.integer "elemental_weakness_amount"
    t.integer "perk_amount"
    t.integer "elemental_resistance_id"
    t.integer "elemental_weakness_id"
    t.integer "perk_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "armor_type"
    t.index ["elemental_resistance_id"], name: "index_armors_on_elemental_resistance_id"
    t.index ["elemental_weakness_id"], name: "index_armors_on_elemental_weakness_id"
    t.index ["perk_id"], name: "index_armors_on_perk_id"
  end

  create_table "behemoths", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "location_id"
    t.index ["location_id"], name: "index_behemoths_on_location_id"
  end

  create_table "behemoths_locations", id: false, force: :cascade do |t|
    t.integer "location_id", null: false
    t.integer "behemoth_id", null: false
    t.index ["location_id", "behemoth_id"], name: "index_behemoths_locations_on_location_id_and_behemoth_id"
  end

  create_table "elemental_damages", force: :cascade do |t|
    t.integer "behemoth_id"
    t.integer "element_id"
    t.index ["behemoth_id"], name: "index_elemental_damages_on_behemoth_id"
    t.index ["element_id"], name: "index_elemental_damages_on_element_id"
  end

  create_table "elemental_weaknesses", force: :cascade do |t|
    t.integer "behemoth_id"
    t.integer "element_id"
    t.index ["behemoth_id"], name: "index_elemental_weaknesses_on_behemoth_id"
    t.index ["element_id"], name: "index_elemental_weaknesses_on_element_id"
  end

  create_table "elements", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "perks", force: :cascade do |t|
    t.string "name"
    t.string "desc"
    t.string "point_1"
    t.string "point_2"
    t.string "point_3"
    t.string "point_4"
    t.string "point_5"
    t.string "point_6"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "reagents", force: :cascade do |t|
    t.string "name"
    t.integer "rarity"
    t.integer "behemoth_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["behemoth_id"], name: "index_reagents_on_behemoth_id"
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.integer "weapon_type"
    t.integer "base_power"
    t.integer "elemental_power_id"
    t.integer "elemental_power_amount"
    t.integer "perk_amount"
    t.integer "perk_id"
    t.integer "cell_slot_type_one"
    t.integer "cell_slot_type_two"
    t.string "unique_effect"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "max_power"
    t.index ["elemental_power_id"], name: "index_weapons_on_elemental_power_id"
    t.index ["perk_id"], name: "index_weapons_on_perk_id"
  end

end
