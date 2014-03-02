# coding: UTF-8

class CreateTbAlternativas < ActiveRecord::Migration

  def up
    execute <<-SQL
      CREATE TABLE tb_alternativas(
        alternativa_id INTEGER NOT NULL,
        avaliacao_id   INTEGER NOT NULL,
        questao_id     INTEGER NOT NULL,
        ds_alternativa TEXT,
        proxima_questao_id INTEGER,
        fg_ativo       BOOLEAN NOT NULL,
        PRIMARY KEY(alternativa_id, questao_id, avaliacao_id),
        CONSTRAINT FK_TB_ALTERNATIVAS
        FOREIGN KEY(questao_id, avaliacao_id) REFERENCES tb_questoes(questao_id, avaliacao_id),
        FOREIGN KEY(proxima_questao_id, avaliacao_id) REFERENCES tb_questoes(questao_id, avaliacao_id)
      );

      INSERT INTO tb_alternativas(avaliacao_id, questao_id, alternativa_id, ds_alternativa, fg_ativo, proxima_questao_id)
      VALUES
      (1, 1, 1, 'Sim', true, 2),
      (1, 1, 2, 'Não', true, 3),
      (1, 2, 1, 'Menos de 1 ano', true, 3),
      (1, 2, 2, 'De um a 5 anos', true, 3),
      (1, 2, 3, 'Mais que 5 anos', true, 3),
      (1, 3, 1, 'Sim', true, 4),
      (1, 3, 2, 'Não', true, 4),
      (1, 4, 1, 'Branca', true, 5),
      (1, 4, 2, 'Preta', true, 5),
      (1, 5, 1, 'Sim', true, 6),
      (1, 5, 2, 'Não', true, 7),
      (1, 6, 1, '14 anos ou mais', true, 7),
      (1, 6, 2, '12 ou 13 anos', true, 7),
      (1, 6, 3, '11 anos ou menos', true, 7),
      (1, 7, 1, 'Ainda não tenho filhos', true, 8),
      (1, 7, 2, 'Menos que 19 anos', true, 8),
      (1, 7, 3, 'De 20 a 24 anos', true, 8),
      (1, 7, 4, 'De 25 a 29 anos', true, 8),
      (1, 7, 5, 'Mais que 30 anos', true, 8),
      (1, 8, 1, 'Não', true, 9),
      (1, 8, 2, 'Um', true, 9),
      (1, 8, 3, 'Dois ou mais', true, 9),
      (1, 9, 1, 'Nunca fiz biópsia', true, 10),
      (1, 9, 2, 'Uma', true, 10),
      (1, 9, 3, 'Duas ou mais', true, 10),
      (1, 10, 1, 'Não aplicado ou desconhecido', true, 11),
      (1, 10, 2, 'Não', true, 11),
      (1, 10, 3, 'Sim', true, 11),
      (1, 11, 1, 'Sim', true, 12),
      (1, 11, 2, 'Não', true, 12),
      (1, 12, 1, 'Não aplicada', true, 13),
      (1, 12, 2, 'Menos de 40 anos', true, 13),
      (1, 12, 3, 'Entre 40 e 44 anos', true, 13),
      (1, 12, 4, 'Entre 45 e 49 anos', true, 13),
      (1, 12, 5, 'Entre 50 e 54 anos', true, 13),
      (1, 12, 6, 'Mais que 54 anos', true, 13),
      (1, 13, 1, 'Não especificado', true, 14),
      (1, 13, 2, 'Nenhum', true, 14),
      (1, 13, 3, '1.5gm/dia', true, 14),
      (1, 13, 4, '5gm/dia', true, 14),
      (1, 13, 5, '15gm/dia', true, 14),
      (1, 13, 6, '30gm/dia', true, 14),
      (1, 13, 7, '60gm/dia', true, 14),
      (1, 13, 8, '60gm/dia ou mais', true, 14),
      (1, 14, 1, 'Não especificado', true, 15),
      (1, 14, 2, '0% de tecido adiposo', true, 15),
      (1, 14, 3, 'Entre 1% e 24%', true, 15),
      (1, 14, 4, 'Entre 25% e 49%', true, 15),
      (1, 14, 5, 'Entre 50% e 74%', true, 15),
      (1, 14, 6, 'Entre 75% e 100%', true, 15),
      (1, 15, 1, 'Sim', true, 16),
      (1, 15, 2, 'Não', true, 16),
      (1, 16, 1, 'Nunca usei', true, 18),
      (1, 16, 2, 'Parou há 1-4 anos', true, 17),
      (1, 16, 3, 'Parou há 5-9 anos', true, 17),
      (1, 16, 4, 'Atualmente em uso', true, 17),
      (1, 16, 5, 'Parou a há 10-14 anos', true, 17),
      (1, 16, 6, 'Parou há  15 anos ou mais', true, 17),
      (1, 17, 1, 'Menos que 20 anos', true, 18),
      (1, 17, 2, 'Entre 20 e 24 anos', true, 18),
      (1, 17, 3, 'Entre 25 e 29 anos', true, 18),
      (1, 17, 4, 'Mais que 29 anos', true, 18),
      (1, 18, 1, 'Nenhum', true, 19),
      (1, 18, 2, 'Um', true, 19),
      (1, 18, 3, 'Dois ou mais', true, 19),
      (1, 19, 1, 'Nenhum', true, NULL),
      (1, 19, 2, 'Menos que 20 anos', true, NULL),
      (1, 19, 3, 'Entre 20 e 24 anos', true,NULL),
      (1, 19, 4, 'Entre 25 e 29 anos', true, NULL),
      (1, 19, 5, 'Mais que 30 anos', true, NULL);
    SQL
  end

  def down
  end

end
