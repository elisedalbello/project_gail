# coding: UTF-8

class CreateTbPacienteReposta < ActiveRecord::Migration

  def up
    execute <<-SQL
      CREATE TABLE tb_paciente_resposta(
        id_paciente    INTEGER NOT NULL,
        sq_questao     INTEGER NOT NULL,
        id_avaliacao   INTEGER NOT NULL,
        sq_alternativa INTEGER NOT NULL,
        dh_inclusão    TIMESTAMP WITHOUT TIME ZONE,
        PRIMARY KEY(id_paciente, sq_questao, id_avaliacao),
        CONSTRAINT FK_TB_PACIENTE_RESPOSTA 
        FOREIGN KEY(sq_alternativa, sq_questao, id_avaliacao) REFERENCES tb_alternativas (sq_alternativa, sq_questao, id_avaliacao),
        CONSTRAINT FK_TB_PACIENTE_RESPOSTA_1 
        FOREIGN KEY(id_paciente) REFERENCES tb_paciente(id_paciente) 
      );
    SQL
  end

  def down
  end

end
