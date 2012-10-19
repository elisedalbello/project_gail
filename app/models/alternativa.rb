class Alternativa < ActiveRecord::Base

  set_table_name "tb_alternativas"
  set_primary_key "sq_alternativa", "sq_questao", "id_avaliacao"

  belongs_to :questao
  has_and_belongs_to_many :paciente_resposta

end
