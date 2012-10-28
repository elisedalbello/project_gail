# == Schema Information
#
# Table name: tb_avaliacoes
#
#  id        :integer          not null
#  descricao :string(60)       not null
#  fg_ativo  :boolean          not null
#

class Avaliacao < ActiveRecord::Base
  
  set_table_name "tb_avaliacoes"
  
  has_many :questoes, :conditions => "fg_ativo = true"
  
  
end
