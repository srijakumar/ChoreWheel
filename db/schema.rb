ActiveRecord::Schema.define(version: 2020_03_13_150038) do

  create_table "chores", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lists", force: :cascade do |t|
    t.string "content"
    t.integer "task_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.index ["task_id"], name: "index_lists_on_task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "content"
    t.integer "chore_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "completed_at"
    t.index ["chore_id"], name: "index_tasks_on_chore_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

  add_foreign_key "lists", "tasks"
  add_foreign_key "tasks", "chores"
end
