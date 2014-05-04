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
      (1, 1, 1, 'Branca', true, 2),
      (1, 1, 2, 'Preta', true, 2),
      (1, 2, 1, '14 anos ou mais', true, 3),
      (1, 2, 2, '12 ou 13 anos', true, 3),
      (1, 2, 3, '11 anos ou menos', true, 3),
      (1, 3, 1, 'Ainda não tenho filhos', true, 4),
      (1, 3, 2, 'Menos que 19 anos', true, 4),
      (1, 3, 3, 'De 20 a 24 anos', true, 4),
      (1, 3, 4, 'De 25 a 29 anos', true, 4),
      (1, 3, 5, 'Mais que 30 anos', true, 4),
      (1, 4, 1, 'Nunca fiz biópsia', true, 5),
      (1, 4, 2, 'Uma', true, 5),
      (1, 4, 3, 'Duas ou mais', true, 5),
      (1, 5, 1, 'Nenhuma biópsia de hiperplásia', true,6),
      (1, 5, 2, 'Pelo menos 1 biópsia sem hiperplásia', true, 6),
      (1, 5, 3, 'Sem hiperplásia atípica e desconhecido estado de hiperplásia', true, 6),
      (1, 5, 4, 'Hiperplásia atípica em pelo menos 1 biópsia', true, 6),
      (1, 6, 1, 'Nenhum', true, NULL),
      (1, 6, 2, 'Um', true, NULL),
      (1, 6, 3, 'Dois ou mais', true, NULL);
    SQL
  end

  def down
  end

end
