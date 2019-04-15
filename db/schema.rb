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

ActiveRecord::Schema.define(version: 2019_04_12_133616) do

  create_table "adminteachers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "teacher_name"
    t.string "teacher_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "f_mcqs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email"
    t.bigint "federal_cource_id"
    t.string "q"
    t.string "o1"
    t.string "o2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["federal_cource_id"], name: "index_f_mcqs_on_federal_cource_id"
  end

  create_table "federal_cource_teachers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "adminteacher_id"
    t.bigint "federal_cource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adminteacher_id"], name: "index_federal_cource_teachers_on_adminteacher_id"
    t.index ["federal_cource_id"], name: "index_federal_cource_teachers_on_federal_cource_id"
  end

  create_table "federal_cources", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "cource_name"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_federal_cources_on_group_id"
  end

  create_table "groups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "group_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "p_mcqs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email"
    t.bigint "punjab_cource_id"
    t.string "q"
    t.string "o1"
    t.string "o2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["punjab_cource_id"], name: "index_p_mcqs_on_punjab_cource_id"
  end

  create_table "punjab_cource_teachers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "adminteacher_id"
    t.bigint "punjab_cource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adminteacher_id"], name: "index_punjab_cource_teachers_on_adminteacher_id"
    t.index ["punjab_cource_id"], name: "index_punjab_cource_teachers_on_punjab_cource_id"
  end

  create_table "punjab_cources", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "cource_name"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_punjab_cources_on_group_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "name", default: "", null: false
    t.integer "role", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "f_mcqs", "federal_cources"
  add_foreign_key "federal_cource_teachers", "adminteachers"
  add_foreign_key "federal_cource_teachers", "federal_cources"
  add_foreign_key "federal_cources", "groups"
  add_foreign_key "p_mcqs", "punjab_cources"
  add_foreign_key "punjab_cource_teachers", "adminteachers"
  add_foreign_key "punjab_cource_teachers", "punjab_cources"
  add_foreign_key "punjab_cources", "groups"
end
