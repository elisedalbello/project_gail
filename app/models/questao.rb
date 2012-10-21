class Questao < ActiveRecord::Base
  
  set_table_name "tb_questoes"
  set_primary_keys :sq_questao, :id_avaliacao
  
  belongs_to :avaliacao
  has_many :alternativa
  
end
