class PacienteResposta < ActiveRecord::Base
  set_table_name "tb_pacientes_respostas"
  set_primary_keys :paciente_id, :questao_id, :avaliacao_id

  has_and_belongs_to_many :alternativas, :conditions => "fg_ativo = true"
  belongs_to :paciente
  
end
