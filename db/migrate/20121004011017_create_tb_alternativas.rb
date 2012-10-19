# coding: UTF-8

class CreateTbAlternativas < ActiveRecord::Migration

  def up
    execute <<-SQL
      CREATE TABLE tb_alternativas(
        sq_alternativa INTEGER NOT NULL,
        id_avaliacao   INTEGER NOT NULL,
        sq_questao     INTEGER NOT NULL,
        ds_alternativa TEXT,
        fg_ativo       INTEGER,
        PRIMARY KEY(sq_alternativa, sq_questao, id_avaliacao),
        CONSTRAINT FK_TB_ALTERNATIVAS 
        FOREIGN KEY(sq_alternativa, id_avaliacao) REFERENCES tb_questao (sq_questao, id_avaliacao)
      );

      INSERT INTO tb_alternativas(id_avaliacao, sq_questao, sq_alternativa, ds_alternativa, fg_ativo)
      VALUES
      (1, 1, 1, 'Sim', 1),
      (1, 1, 2, 'Não', 1),
      (1, 2, 1, 'Menos de 1 ano', 1),
      (1, 2, 2, 'De um á 5 anos', 1),
      (1, 2, 3, 'Mais que 5 anos', 1),
      (1, 3, 1, 'Sim', 1),
      (1, 3, 2, 'Não', 1),
      (1, 4, 1, 'Branca', 1),
      (1, 4, 2, 'Preta', 1),
      (1, 5, 1, 'Sim', 1),
      (1, 5, 2, 'Não', 1),
      (1, 6, 1, 'Ainda não tenho filhos', 1),
      (1, 6, 2, 'Menos que 19 anos', 1),
      (1, 6, 3, 'De 20 á 24 anos', 1),
      (1, 6, 4, 'De 25 á 29 anos', 1),
      (1, 6, 5, 'Mais que 30 anos', 1),
      (1, 7, 1, 'Não', 1),
      (1, 7, 2, 'Um', 1),
      (1, 7, 3, 'Dois ou mais', 1),
      (1, 8, 1, '14 anos ou mais', 1),
      (1, 8, 2, '12 ou 13 anos', 1),
      (1, 8, 3, '11 anos ou menos', 1),
      (1, 9, 1, 'Nunca fiz biópsia', 1),
      (1, 9, 2, 'Uma', 1),
      (1, 9, 3, 'Duas ou mais', 1),
      (1, 10, 1, 'Não aplicado ou desconhecido', 1),
      (1, 10, 2, 'Não', 1),
      (1, 10, 3, 'Sim', 1),
      (1, 11, 1, 'Sim', 1),
      (1, 11, 2, 'Não', 1),
      (1, 12, 1, 'Não aplicada', 1),
      (1, 12, 2, 'Menos de 40 anos', 1),
      (1, 12, 3, 'Entre 40 e 44 anos', 1),
      (1, 12, 4, 'Entre 45 e 49 anos', 1),
      (1, 12, 5, 'Entre 50 e 54 anos', 1),
      (1, 12, 6, 'Mais que 54 anos', 1),
      (1, 13, 1, 'Não especificado', 1),
      (1, 13, 2, 'Nenhum', 1),
      (1, 13, 3, '1.5gm/dia', 1),
      (1, 13, 4, '5gm/dia', 1),
      (1, 13, 5, '15gm/dia', 1),
      (1, 13, 6, '30gm/dia', 1),
      (1, 13, 7, '60gm/dia', 1),
      (1, 13, 8, '60gm/dia ou mais', 1),
      (1, 14, 1, 'Não especificado', 1),
      (1, 14, 2, '0% de tecido adiposo', 1),
      (1, 14, 3, 'Entre 1% e 24%', 1),
      (1, 14, 4, 'Entre 25% e 49%', 1),
      (1, 14, 5, 'Entre 50% e 74%', 1),
      (1, 14, 6, 'Entre 75% e 100%', 1),
      (1, 15, 1, 'Sim', 1),
      (1, 15, 2, 'Não', 1),
      (1, 16, 1, 'Nunca usei', 1),
      (1, 16, 2, 'Parou há 1-4 anos', 1),
      (1, 16, 3, 'Parou há 5-9 anos', 1),
      (1, 16, 4, 'Atualmente em uso', 1),
      (1, 16, 5, 'Parou a há 10-14 anos', 1),
      (1, 16, 6, 'Parou há  15 anos ou mais', 1),
      (1, 17, 1, 'Menos que 20 anos', 1),
      (1, 17, 2, 'Entre 20 e 24 anos', 1),
      (1, 17, 3, 'Entre 25 e 29 anos', 1),
      (1, 17, 4, 'Mais que 29 anos', 1),
      (1, 18, 1, 'Nenhum', 1),
      (1, 18, 2, 'Um', 1),
      (1, 18, 3, 'Dois ou mais', 1),
      (1, 18, 4, 'Menos que 20 anos', 1),
      (1, 18, 5, 'Entre 20 e 24 anos', 1),
      (1, 18, 6, 'Entre 25 e 29 anos', 1),
      (1, 18, 7, 'Mais que 30 anos', 1);
    SQL
  end

  def down
  end

end
