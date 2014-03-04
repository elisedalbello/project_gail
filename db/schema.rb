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

ActiveRecord::Schema.define(:version => 20140303143801) do

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "tb_alternativas", :id => false, :force => true do |t|
    t.integer "alternativa_id",     :null => false
    t.integer "avaliacao_id",       :null => false
    t.integer "questao_id",         :null => false
    t.text    "ds_alternativa"
    t.integer "proxima_questao_id"
    t.boolean "fg_ativo",           :null => false
  end

  create_table "tb_avaliacoes", :id => false, :force => true do |t|
    t.integer "id",                      :null => false
    t.string  "descricao", :limit => 60, :null => false
    t.boolean "fg_ativo",                :null => false
  end

  add_index "tb_avaliacoes", ["descricao"], :name => "tb_avaliacoes_descricao_key", :unique => true

  create_table "tb_enderecos", :force => true do |t|
    t.integer "estado_id",                 :null => false
    t.string  "rua",         :limit => 60
    t.string  "nr",          :limit => 10
    t.string  "complemento", :limit => 60
    t.string  "bairro",      :limit => 60
    t.string  "cep",         :limit => 10
    t.string  "cidade",      :limit => 60
    t.boolean "fg_ativo",                  :null => false
  end

  create_table "tb_escolaridades", :id => false, :force => true do |t|
    t.integer "id",                            :null => false
    t.string  "ds_escolaridade", :limit => 40
    t.boolean "fg_ativo",                      :null => false
  end

  create_table "tb_estados", :id => false, :force => true do |t|
    t.integer "id",                      :null => false
    t.string  "ds_estado", :limit => 60
    t.string  "sigla",     :limit => 2
    t.boolean "fg_ativo",                :null => false
  end

  create_table "tb_pacientes", :force => true do |t|
    t.integer  "endereco_id",                   :null => false
    t.integer  "escolaridade_id",               :null => false
    t.string   "nm_paciente",     :limit => 60
    t.datetime "dt_nascimento"
    t.integer  "idade",                         :null => false
    t.string   "naturalidade",    :limit => 60
    t.string   "nr_rg",           :limit => 20
    t.boolean  "convenio"
    t.string   "ds_convenio",     :limit => 60
    t.boolean  "fg_ativo",                      :null => false
  end

  create_table "tb_pacientes_respostas", :id => false, :force => true do |t|
    t.integer "paciente_id",    :null => false
    t.integer "questao_id",     :null => false
    t.integer "avaliacao_id",   :null => false
    t.integer "alternativa_id", :null => false
  end

  create_table "tb_questoes", :id => false, :force => true do |t|
    t.integer "avaliacao_id", :null => false
    t.integer "questao_id",   :null => false
    t.text    "ds_questao"
    t.boolean "fg_ativo",     :null => false
  end

end
