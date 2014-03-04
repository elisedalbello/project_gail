class PacienteResposta < ActiveRecord::Base
  self.table_name = "tb_pacientes_respostas"
  self.primary_keys = [:paciente_id, :questao_id, :avaliacao_id]
  
  attr_accessible :alternativa_id, :paciente_id, :avaliacao_id, :questao_id

  belongs_to :paciente
  belongs_to :alternativa,  :class_name => "Alternativa", :foreign_key => [:alternativa_id, :questao_id, :avaliacao_id]
  def self.salva_resposta(paciente_respostas)
    paciente_respostas.each do |pr|
        raise ActiveRecord::Rollback unless pr.save
    end
  end
end
