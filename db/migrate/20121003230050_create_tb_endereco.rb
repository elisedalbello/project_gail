# coding: UTF-8

class CreateTbEndereco < ActiveRecord::Migration

  def up
    execute <<-SQL
      CREATE TABLE tb_endereco(
        id_endereco SERIAL NOT NULL,
        id_estado   INTEGER NOT NULL,
        rua         VARCHAR(60) NULL,
        nr          VARCHAR(10) NULL,
        complemento VARCHAR(60) NULL,
        bairro      VARCHAR(60) NULL,
        cep         VARCHAR(10) NULL,
        cidade      VARCHAR(60) NULL,
        fg_ativo  	INTEGER NULL,
        PRIMARY KEY(id_endereco),
        CONSTRAINT FK_ENDERECO
        FOREIGN KEY(id_estado) REFERENCES tb_estado(id_estado)
      );
    SQL
  end

  def down
  end

end
