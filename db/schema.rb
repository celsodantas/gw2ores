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

ActiveRecord::Schema.define(:version => 20140315152438) do

  create_table "maps", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "image_mini"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "size_x"
    t.integer  "size_y"
    t.integer  "server_id"
    t.boolean  "high_end",   :default => false
  end

  create_table "maps_servers", :id => false, :force => true do |t|
    t.integer "map_id"
    t.integer "server_id"
  end

  create_table "ore_confirmations", :force => true do |t|
    t.integer  "ore_node_id"
    t.string   "user_ip"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "ore_nodes", :force => true do |t|
    t.string   "name"
    t.integer  "map_id"
    t.integer  "server_id"
    t.integer  "reset_date_id"
    t.float    "x"
    t.float    "y"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "ore_confirmations_count", :default => 0, :null => false
  end

  create_table "ore_reset_histories", :force => true do |t|
    t.string   "full_response"
    t.boolean  "new_version"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "reset_dates", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "servers", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "ore_nodes_count", :default => 0, :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "role"
  end

end
