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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141015235621) do

  create_table "cuestionarios", force: true do |t|
    t.string   "nombre"
    t.integer  "preguntas_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cuestionarios", ["preguntas_id"], name: "index_cuestionarios_on_preguntas_id"

  create_table "dinosaurios", force: true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "periodo_id"
    t.string   "icono_file_name"
    t.string   "icono_content_type"
    t.integer  "icono_file_size"
    t.datetime "icono_updated_at"
  end

  add_index "dinosaurios", ["periodo_id"], name: "index_dinosaurios_on_periodo_id"

  create_table "estacions", force: true do |t|
    t.integer  "indice"
    t.integer  "dinosaurio_id"
    t.integer  "preguntas_id"
    t.integer  "recorrido_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "estacions", ["dinosaurio_id"], name: "index_estacions_on_dinosaurio_id"
  add_index "estacions", ["preguntas_id"], name: "index_estacions_on_preguntas_id"
  add_index "estacions", ["recorrido_id"], name: "index_estacions_on_recorrido_id"

  create_table "periodos", force: true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pregunta", force: true do |t|
    t.string   "contenido"
    t.integer  "cuestionario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pregunta", ["cuestionario_id"], name: "index_pregunta_on_cuestionario_id"

  create_table "recorridos", force: true do |t|
    t.string   "nombre"
    t.integer  "estacions_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recorridos", ["estacions_id"], name: "index_recorridos_on_estacions_id"

  create_table "respuesta", force: true do |t|
    t.string   "contenido"
    t.string   "feedback"
    t.boolean  "es_correcta"
    t.integer  "pregunta_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "respuesta", ["pregunta_id"], name: "index_respuesta_on_pregunta_id"

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
