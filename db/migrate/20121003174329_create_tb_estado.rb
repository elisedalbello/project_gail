# coding: UTF-8

class CreateTbEstado < ActiveRecord::Migration

  def up
    execute <<-SQL
      CREATE TABLE tb_estados(
        id         INTEGER NOT NULL,
        ds_estado  VARCHAR(60) NULL,
        sigla      CHAR(2) NULL,
        fg_ativo   BOOLEAN NOT NULL,
        PRIMARY KEY(id)
      );

      INSERT INTO tb_estados (id, ds_estado, sigla, fg_ativo)
      VALUES
      (1, 'Acre', 'AC', true),
      (2, 'Alagoas', 'AL', true),
      (3, 'Amapá', 'AP', true),
      (4, 'Amazonas', 'AM', true),
      (5, 'Bahia', 'BA', true),
      (6, 'Ceará', 'CE', true),
      (7, 'Distrito Federal', 'DF', true),
      (8, 'Espírito Santo', 'ES', true),
      (9, 'Goiás', 'GO', true),
      (10, 'Maranhão', 'MA', true),
      (11, 'Mato Grosso', 'MT', true),
      (12, 'Mato Grosso do Sul', 'MS', true),
      (13, 'Minas Gerais', 'MG', true),
      (14, 'Pará', 'PA', true),
      (15, 'Paraíba', 'PB', true),
      (16, 'Paraná', 'PR', true),
      (17, 'Pernambuco', 'PE', true),
      (18, 'Piauí', 'PI', true),
      (19, 'Rio de Janeiro', 'RJ', true),
      (20, 'Rio Grande do Norte', 'RN', true),
      (21, 'Rio Grande do Sul', 'RS', true),
      (22, 'Rondônia', 'RO', true),
      (23, 'Roraima', 'RR', true),
      (24, 'Santa Catarina', 'SC', true),
      (25, 'São Paulo', 'SP', true),
      (26, 'Sergipe', 'SE', true),
      (27, 'Tocantins', 'TO', true);
    SQL
  end

  def down
  end

end
