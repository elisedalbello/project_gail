class Alternativa < ActiveRecord::Base

  set_table_name "tb_alternativas"
  set_primary_keys :alternativa_id, :questao_id, :avaliacao_id

  belongs_to :questao
  
  has_and_belongs_to_many :paciente_resposta

end
