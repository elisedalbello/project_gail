# coding: UTF-8

class CreateTbEndereco < ActiveRecord::Migration

  def up
    execute <<-SQL
      CREATE TABLE tb_enderecos(
        id          SERIAL NOT NULL,
        estado_id   INTEGER NOT NULL,
        rua         VARCHAR(60) NULL,
        nr          VARCHAR(10) NULL,
        complemento VARCHAR(60) NULL,
        bairro      VARCHAR(60) NULL,
        cep         VARCHAR(10) NULL,
        cidade      VARCHAR(60) NULL,
        fg_ativo  	BOOLEAN NOT NULL,
        PRIMARY KEY(id),
        CONSTRAINT FK_ENDERECO
        FOREIGN KEY(estado_id) REFERENCES tb_estados(id)
      );
    SQL
  end

  def down
  end

end
