# coding: UTF-8

class CreateTbAvaliacao < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE TABLE tb_avaliacoes(
        id           INTEGER NOT NULL,
        descricao    VARCHAR(60) UNIQUE NOT NULL,
        fg_ativo     BOOLEAN NOT NULL,
        PRIMARY KEY (id)
      );

      INSERT INTO tb_avaliacoes(id, descricao, fg_ativo)
      VALUES(1, 'Índice de Gail', true);
    SQL
  end

  def down
  end

end
