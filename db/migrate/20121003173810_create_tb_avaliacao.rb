# coding: UTF-8

class CreateTbAvaliacao < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE TABLE tb_avaliacao(
        id_avaliacao INTEGER NOT NULL,
        descricao    VARCHAR(60),
        fg_ativo     INTEGER,
        PRIMARY KEY (id_avaliacao)
      );

      INSERT INTO tb_avaliacao(id_avaliacao, descricao, fg_ativo)
      VALUES(1, 'Índice de Gail', 1);
    SQL
  end

  def down
  end

end
