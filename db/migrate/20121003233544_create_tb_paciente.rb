# coding: UTF-8

class CreateTbPaciente < ActiveRecord::Migration

  def up
    execute <<-SQL
      CREATE TABLE tb_pacientes(
        id              SERIAL NOT NULL,
        endereco_id     INTEGER NOT NULL,
        escolaridade_id INTEGER NOT NULL,
        nm_paciente     VARCHAR(60) NULL,
        dt_nascimento   TIMESTAMP NULL,
        idade           INTEGER NOT NULL,
        naturalidade    VARCHAR(60) NULL,
        nr_rg           VARCHAR(20) NULL,
        convenio        BOOLEAN NULL,
        ds_convenio     VARCHAR(60) NULL,
        fg_ativo        BOOLEAN NOT NULL,
        PRIMARY KEY(id),
        CONSTRAINT FK_TB_PACIENTE_1
        FOREIGN KEY(endereco_id) REFERENCES tb_enderecos(id),
        CONSTRAINT FK_TB_PACIENTE_2
        FOREIGN KEY(escolaridade_id) REFERENCES tb_escolaridades(id)
      );
    SQL
  end

  def down
  end

end
