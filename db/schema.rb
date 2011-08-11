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

ActiveRecord::Schema.define(:version => 20110404193440) do

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies_restaurants", :id => false, :force => true do |t|
    t.integer "company_id"
    t.integer "restaurant_id"
  end

  create_table "lunch_options", :force => true do |t|
    t.integer  "restaurant_id"
    t.integer  "lunch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lunches", :force => true do |t|
    t.string   "state"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "winning_restaurant_id"
    t.integer  "company_id"
  end

  create_table "restaurants", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurants_tags", :id => false, :force => true do |t|
    t.integer "restaurant_id"
    t.integer "tag_id"
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "token"
    t.string   "fb_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.integer  "company_id"
  end

  create_table "votes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "lunch_option_id"
    t.integer  "lunch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
