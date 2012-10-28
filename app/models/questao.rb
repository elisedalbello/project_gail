class Questao < ActiveRecord::Base
  
  set_table_name "tb_questoes"
  set_primary_keys :questao_id, :avaliacao_id
  
  belongs_to :avaliacao
  
  has_many :alternativas, :conditions => "fg_ativo = true"
  
end
