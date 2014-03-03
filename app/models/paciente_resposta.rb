class PacienteResposta < ActiveRecord::Base
  self.table_name = "tb_pacientes_respostas"
  self.primary_keys = [:paciente_id, :questao_id, :avaliacao_id]

  has_and_belongs_to_many :alternativas, :conditions => "fg_ativo = true"
  belongs_to :paciente

  attr_accessible :alternativa_id, :paciente_id, :avaliacao_id, :questao_id


  def self.salva_resposta(paciente_respostas)
    paciente_respostas.each do |pr|
        raise ActiveRecord::Rollback unless pr.save
    end
  end
end
