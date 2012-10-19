# coding: UTF-8

class CreateTbPaciente < ActiveRecord::Migration

  def up
    execute <<-SQL
      CREATE TABLE tb_paciente(
        id_paciente     INTEGER NOT NULL,
        id_endereco     INTEGER NOT NULL,
        id_escolaridade INTEGER NOT NULL,
        nm_paciente     VARCHAR(60) NULL,
        dt_nascimento   TIMESTAMP NULL,
        idade           INTEGER NULL,
        naturalidade    VARCHAR(60) NULL,
        nr_rg           VARCHAR(20) NULL,
        convenio        BOOLEAN NULL,
        ds_convenio     VARCHAR(60) NULL,
        fg_ativo        INTEGER NULL,
        PRIMARY KEY(id_paciente),
        CONSTRAINT FK_TB_PACIENTE_1
        FOREIGN KEY(id_endereco) REFERENCES tb_endereco(id_endereco),
        CONSTRAINT FK_TB_PACIENTE_2
        FOREIGN KEY(id_escolaridade) REFERENCES tb_escolaridade(id_escolaridade)
      );
    SQL
  end

  def down
  end

end
