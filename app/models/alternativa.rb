class Alternativa < ActiveRecord::Base

  set_table_name "tb_alternativas"
  set_primary_keys :sq_alternativa, :sq_questao, :id_avaliacaos

  belongs_to :questao
  has_and_belongs_to_many :paciente_resposta

end
