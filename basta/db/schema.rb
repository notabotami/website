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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20141208042109) do

  create_table "preferences", :force => true do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "the_type"
    t.boolean  "okayed"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "preferences", ["user_id"], :name => "index_preferences_on_user_id"

  create_table "schedules", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "shift_ranks", :force => true do |t|
    t.string   "name"
    t.text     "user_ranks_allowed"
    t.text     "applicable_shifts"
    t.text     "description"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "shiftempls", :force => true do |t|
    t.string   "section"
    t.datetime "start_time"
    t.integer  "templ_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "shiftempls", ["templ_id"], :name => "index_shiftempls_on_templ_id"

  create_table "shifts", :force => true do |t|
    t.string   "section"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.datetime "date"
    t.string   "status"
  end

  add_index "shifts", ["user_id"], :name => "index_shifts_on_user_id"

  create_table "templs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_ranks", :force => true do |t|
    t.string   "name"
    t.text     "shift_ranks_allowed"
    t.text     "description"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "user_id"
    t.string   "email"
    t.string   "password"
    t.string   "session_token"
    t.string   "phone_number"
    t.string   "role"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
