# coding: UTF-8

class CreateTbEscolaridade < ActiveRecord::Migration

  def up
    execute <<-SQL
      CREATE TABLE tb_escolaridade(
        id_escolaridade INTEGER NOT NULL,
        ds_escolaridade VARCHAR(40) NULL,
        fg_ativo        INTEGER NULL,
        PRIMARY KEY(id_escolaridade)
      );

      INSERT INTO tb_escolaridade (id_escolaridade, ds_escolaridade, fg_ativo)
      VALUES
      (1, 'Sem Escolaridade', 1),
      (2, 'Ensino Fundamental Incompleto', 1),
      (3, 'Ensino Fundamental Completo', 1),
      (4, 'Ensino Médio Incompleto', 1),
      (5, 'Ensino Médio Completo', 1),
      (6, 'Ensino Superior Incompleto', 1),
      (7, 'Ensino Superior Completo', 1),
      (8, 'Especialização', 1),
      (9, 'Mestrado', 1),
      (10, 'Pós-Graduação', 1),
      (11, 'Doutorado', 1),
      (12, 'Pós-Doutorado', 1);
    SQL
  end

  def down
  end

end
