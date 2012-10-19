# == Schema Information
#
# Table name: tb_escolaridade
#
#  id_escolaridade :integer          not null, primary key
#  ds_escolaridade :string(40)
#  fg_ativo        :integer
#

class Escolaridade < ActiveRecord::Base
  
  set_table_name "tb_escolaridade"
  set_primary_key "id_escolaridade"
  
  has_many :paciente
  
end
