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

ActiveRecord::Schema.define(version: 2019_05_10_055627) do

  create_table "boardgroups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "group_id"
    t.bigint "board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_boardgroups_on_board_id"
    t.index ["group_id"], name: "index_boardgroups_on_group_id"
  end

  create_table "boards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_boards_on_user_id"
  end

  create_table "course_questions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "question"
    t.string "answer"
    t.string "option1"
    t.string "option2"
    t.string "option3"
    t.string "option4"
    t.string "option5"
    t.string "questiontype"
    t.bigint "teachercourse_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teachercourse_id"], name: "index_course_questions_on_teachercourse_id"
  end

  create_table "courses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "boardgroup_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boardgroup_id"], name: "index_courses_on_boardgroup_id"
  end

  create_table "groups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mcqs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "question"
    t.string "option1"
    t.string "option2"
    t.string "option3"
    t.string "option4"
    t.string "option5"
    t.string "option6"
    t.bigint "teachercourse_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teachercourse_id"], name: "index_mcqs_on_teachercourse_id"
  end

  create_table "qquizzes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "expire_date"
    t.bigint "teachercourse_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teachercourse_id"], name: "index_qquizzes_on_teachercourse_id"
  end

  create_table "question_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "comment"
    t.boolean "status"
    t.bigint "course_question_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_question_id"], name: "index_question_comments_on_course_question_id"
    t.index ["user_id"], name: "index_question_comments_on_user_id"
  end

  create_table "quizquestions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "qquiz_id"
    t.bigint "course_question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_question_id"], name: "index_quizquestions_on_course_question_id"
    t.index ["qquiz_id"], name: "index_quizquestions_on_qquiz_id"
  end

  create_table "student_results", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "quizquestion_id"
    t.string "ans"
    t.integer "max"
    t.integer "obtain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quizquestion_id"], name: "index_student_results_on_quizquestion_id"
    t.index ["user_id"], name: "index_student_results_on_user_id"
  end

  create_table "teachercourses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "course_id"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_teachercourses_on_course_id"
    t.index ["teacher_id"], name: "index_teachercourses_on_teacher_id"
  end

  create_table "teachers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
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

  add_foreign_key "boardgroups", "boards"
  add_foreign_key "boardgroups", "groups"
  add_foreign_key "boards", "users"
  add_foreign_key "course_questions", "teachercourses"
  add_foreign_key "courses", "boardgroups"
  add_foreign_key "mcqs", "teachercourses"
  add_foreign_key "qquizzes", "teachercourses"
  add_foreign_key "question_comments", "course_questions"
  add_foreign_key "question_comments", "users"
  add_foreign_key "quizquestions", "course_questions"
  add_foreign_key "quizquestions", "qquizzes"
  add_foreign_key "student_results", "quizquestions"
  add_foreign_key "student_results", "users"
  add_foreign_key "teachercourses", "courses"
  add_foreign_key "teachercourses", "teachers"
end
