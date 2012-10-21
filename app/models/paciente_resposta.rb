class PacienteResposta < ActiveRecord::Base
  set_table_name "tb_paciente_resposta"
  set_primary_keys :id_paciente, :sq_questao, :id_avaliacao

  has_and_belongs_to_many :alternativa
  belongs_to :paciente
  
end
