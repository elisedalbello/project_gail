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

ActiveRecord::Schema.define(:version => 20121011192335) do

  create_table "tb_alternativas", :id => false, :force => true do |t|
    t.integer "sq_alternativa", :null => false
    t.integer "id_avaliacao",   :null => false
    t.integer "sq_questao",     :null => false
    t.text    "ds_alternativa"
    t.integer "fg_ativo"
  end

  create_table "tb_avaliacao", :id => false, :force => true do |t|
    t.integer "id_avaliacao",               :null => false
    t.string  "descricao",    :limit => 60
    t.integer "fg_ativo"
  end

  create_table "tb_endereco", :id => false, :force => true do |t|
    t.integer "id_endereco",               :null => false
    t.integer "id_estado",                 :null => false
    t.string  "rua",         :limit => 60
    t.string  "nr",          :limit => 10
    t.string  "complemento", :limit => 60
    t.string  "bairro",      :limit => 60
    t.string  "cep",         :limit => 10
    t.string  "cidade",      :limit => 60
    t.integer "fg_ativo"
  end

  create_table "tb_escolaridade", :id => false, :force => true do |t|
    t.integer "id_escolaridade",               :null => false
    t.string  "ds_escolaridade", :limit => 40
    t.integer "fg_ativo"
  end

  create_table "tb_estado", :id => false, :force => true do |t|
    t.integer "id_estado",               :null => false
    t.string  "ds_estado", :limit => 60
    t.string  "sigla",     :limit => 2
    t.integer "fg_ativo"
  end

  create_table "tb_paciente", :id => false, :force => true do |t|
    t.integer  "id_paciente",                   :null => false
    t.integer  "id_endereco",                   :null => false
    t.integer  "id_escolaridade",               :null => false
    t.string   "nm_paciente",     :limit => 60
    t.datetime "dt_nascimento"
    t.integer  "idade"
    t.string   "naturalidade",    :limit => 60
    t.string   "nr_rg",           :limit => 20
    t.boolean  "convenio"
    t.string   "ds_convenio",     :limit => 60
    t.integer  "fg_ativo"
  end

  create_table "tb_paciente_resposta", :id => false, :force => true do |t|
    t.integer  "id_paciente",                   :null => false
    t.integer  "sq_questao",                    :null => false
    t.integer  "id_avaliacao",                  :null => false
    t.integer  "sq_alternativa",                :null => false
    t.datetime "dh_inclusão"
    t.integer  "fg_ativo",       :default => 1
  end

  create_table "tb_questao", :id => false, :force => true do |t|
    t.integer "id_avaliacao", :null => false
    t.integer "sq_questao",   :null => false
    t.text    "ds_questao"
    t.integer "fg_ativo"
  end

end
