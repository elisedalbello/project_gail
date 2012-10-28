# coding: UTF-8

class CreateTbPacienteReposta < ActiveRecord::Migration

  def up
    execute <<-SQL
      CREATE TABLE tb_pacientes_respostas(
        paciente_id    INTEGER NOT NULL,
        questao_id     INTEGER NOT NULL,
        avaliacao_id   INTEGER NOT NULL,
        alternativa_id INTEGER NOT NULL,
        PRIMARY KEY(paciente_id, questao_id, avaliacao_id, alternativa_id),
        CONSTRAINT FK_TB_PACIENTE_RESPOSTA 
        FOREIGN KEY(alternativa_id, questao_id, avaliacao_id) REFERENCES tb_alternativas(alternativa_id, questao_id, avaliacao_id),
        CONSTRAINT FK_TB_PACIENTE_RESPOSTA_1 
        FOREIGN KEY(paciente_id) REFERENCES tb_pacientes(id) 
      );
    SQL
  end

  def down
  end

end
