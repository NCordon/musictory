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

ActiveRecord::Schema.define(version: 20160902203203) do

  create_table "catalogo", force: :cascade do |t|
    t.string   "titulo"
    t.string   "grupo"
    t.string   "genero"
    t.datetime "created_at",           precision: 6,  null: false
    t.datetime "updated_at",           precision: 6,  null: false
    t.string   "portada_file_name"
    t.string   "portada_content_type"
    t.integer  "portada_file_size",    precision: 38
    t.datetime "portada_updated_at",   precision: 6
  end

  create_table "cd", force: :cascade do |t|
    t.integer  "cantidad",    precision: 38
    t.integer  "catalogo_id", precision: 38
    t.datetime "created_at",  precision: 6,  null: false
    t.datetime "updated_at",  precision: 6,  null: false
    t.integer  "precio",      precision: 38
  end

  add_index "cd", ["catalogo_id"], name: "index_cd_on_catalogo_id"

  create_table "pedido", force: :cascade do |t|
    t.integer  "cantidad",         precision: 38
    t.datetime "fechaRealizacion", precision: 6
    t.datetime "fechaEntrada",     precision: 6
    t.datetime "fechaCancelacion", precision: 6
    t.integer  "formato",          precision: 38
    t.datetime "created_at",       precision: 6,  null: false
    t.datetime "updated_at",       precision: 6,  null: false
    t.string   "titulo"
    t.string   "grupo"
  end

  create_table "venta", force: :cascade do |t|
    t.integer  "catalogo_id",   precision: 38
    t.integer  "precio",        precision: 38
    t.datetime "fechaVenta",    precision: 6
    t.integer  "formato",       precision: 38
    t.datetime "created_at",    precision: 6,  null: false
    t.datetime "updated_at",    precision: 6,  null: false
    t.string   "observaciones"
  end

  add_index "venta", ["catalogo_id"], name: "index_venta_on_catalogo_id"

  create_table "vinilo", force: :cascade do |t|
    t.integer  "cantidad",    precision: 38
    t.integer  "catalogo_id", precision: 38
    t.datetime "created_at",  precision: 6,  null: false
    t.datetime "updated_at",  precision: 6,  null: false
    t.integer  "precio",      precision: 38
  end

  add_index "vinilo", ["catalogo_id"], name: "index_vinilo_on_catalogo_id"

  add_foreign_key "cd", "catalogo"
  add_foreign_key "venta", "catalogo"
  add_foreign_key "vinilo", "catalogo"
