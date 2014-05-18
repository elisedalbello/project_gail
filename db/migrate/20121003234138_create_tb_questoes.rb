# coding: UTF-8

class CreateTbQuestoes < ActiveRecord::Migration

  def up
    execute <<-SQL
      CREATE TABLE tb_questoes(
        avaliacao_id INTEGER NOT NULL,
        questao_id   INTEGER NOT NULL,
        ds_questao   TEXT,
        fg_ativo     BOOLEAN NOT NULL,
        PRIMARY KEY(questao_id, avaliacao_id),
        CONSTRAINT FK_TB_QUESTOES
        FOREIGN KEY(avaliacao_id) REFERENCES tb_avaliacoes(id)
      );

      INSERT INTO tb_questoes(avaliacao_id, questao_id, ds_questao, fg_ativo)
      VALUES
      (1, 1, 'Qual a sua cor?', true),
      (1, 2, 'Com qual idade ocorreu a sua primeira menstruação?', true),
      (1, 3, 'Com que idade você teve seu primeiro filho?', true),
      (1, 4, 'Quantas vezes você fez biópsias mamárias?', true),
      (1, 5, 'Já teve Hiperplásia Atípica?', true),
      (1, 6, 'Número de parentes de 1ºGrau com câncer de mama:', true);
    SQL
  end

  def down
  end

end
