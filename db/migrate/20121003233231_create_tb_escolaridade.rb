# coding: UTF-8

class CreateTbEscolaridade < ActiveRecord::Migration

  def up
    execute <<-SQL
      CREATE TABLE tb_escolaridades(
        id              INTEGER NOT NULL,
        ds_escolaridade VARCHAR(40) NULL,
        fg_ativo        BOOLEAN NOT NULL,
        PRIMARY KEY(id)
      );

      INSERT INTO tb_escolaridades (id, ds_escolaridade, fg_ativo)
      VALUES
      (1, 'Sem Escolaridade', true),
      (2, 'Ensino Fundamental Incompleto', true),
      (3, 'Ensino Fundamental Completo', true),
      (4, 'Ensino Médio Incompleto', true),
      (5, 'Ensino Médio Completo', true),
      (6, 'Ensino Superior Incompleto', true),
      (7, 'Ensino Superior Completo', true),
      (8, 'Especialização', true),
      (9, 'Mestrado', true),
      (10, 'Pós-Graduação', true),
      (11, 'Doutorado', true),
      (12, 'Pós-Doutorado', true);
    SQL
  end

  def down
  end

end
