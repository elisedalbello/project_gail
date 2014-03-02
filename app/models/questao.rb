class Questao < ActiveRecord::Base

  set_table_name "tb_questoes"
  set_primary_keys :questao_id, :avaliacao_id

  belongs_to :avaliacao

  has_many :alternativas, :conditions => "fg_ativo = true"

  def next(alternativa_selecionada)
    alternativa_selecionada.proxima_questao
  end

  def prev(current_question)
    Questao.where("avaliacao_id = :avaliacao_id AND questao_id < :questao_id",
    	:avaliacao_id => avaliacao_id, :questao_id => questao_id).first
  end

end
