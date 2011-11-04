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

ActiveRecord::Schema.define(:version => 20111101131710) do

  create_table "bouts", :force => true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.text     "description"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", :force => true do |t|
    t.string   "company_name"
    t.string   "fantasy_name"
    t.string   "cnpj"
    t.string   "phone"
    t.string   "address"
    t.string   "district"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "responsible"
    t.string   "segment"
    t.date     "date_visit"
    t.string   "email"
    t.string   "electronic_address"
    t.string   "doctor"
    t.string   "nurse"
    t.string   "security"
    t.string   "engineering"
    t.string   "rh_responsible"
    t.string   "rh_contact"
    t.boolean  "gymnastics"
    t.text     "reason_gymnastics"
    t.text     "quality"
    t.text     "map"
    t.text     "absenteeism"
    t.text     "rotation"
    t.integer  "male_workers"
    t.integer  "female_workers"
    t.text     "agreement"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "functionaries", :force => true do |t|
    t.integer  "company_id"
    t.integer  "sector_id"
    t.string   "name"
    t.string   "internal_code"
    t.boolean  "active"
    t.date     "inactivation_date"
    t.text     "reason"
    t.boolean  "sex"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name",              :limit => 40
    t.string   "authorizable_type", :limit => 40
    t.integer  "authorizable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sectors", :force => true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.text     "description"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_sessions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name",                              :null => false
    t.string   "last_name"
    t.string   "email",                             :null => false
    t.string   "crypted_password",                  :null => false
    t.string   "password_salt",                     :null => false
    t.string   "persistence_token",                 :null => false
    t.string   "perishable_token",                  :null => false
    t.integer  "login_count",        :default => 0, :null => false
    t.integer  "failed_login_count", :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
