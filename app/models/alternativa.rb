class Alternativa < ActiveRecord::Base

  self.table_name = "tb_alternativas"
  self.primary_keys = [:alternativa_id, :questao_id, :avaliacao_id]

  belongs_to :questao

  has_and_belongs_to_many :paciente_resposta

  def proxima_questao
    if (!proxima_questao_id)
        return nil
    end
    Questao.find(proxima_questao_id, avaliacao_id) 
  end


end
