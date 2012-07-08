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

ActiveRecord::Schema.define(:version => 20120605181949) do

  create_table "firm_partners", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "date_of_joining"
    t.string   "address1"
    t.string   "address2"
    t.integer  "partnership_deed_id"
    t.boolean  "status"
    t.integer  "age"
    t.string   "father_name"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "partnership_deeds", :force => true do |t|
    t.string   "firm_name"
    t.string   "firm_address"
    t.string   "filled_by"
    t.datetime "duration"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone_number"
    t.boolean  "status"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
