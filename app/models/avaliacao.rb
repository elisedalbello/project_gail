# == Schema Information
#
# Table name: tb_avaliacao
#
#  id_avaliacao :integer          not null, primary key
#  descricao    :string(60)
#  fg_ativo     :integer
#

class Avaliacao < ActiveRecord::Base
  
  set_table_name "tb_avaliacao"
  set_primary_key "id_avaliacao"
  
  has_many :questao
  
end
