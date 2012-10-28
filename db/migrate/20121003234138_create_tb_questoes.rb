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
      (1, 1, 'Você faz reposição hormonal?', true),
      (1, 2, 'Há quanto tempo?', true),
      (1, 3, 'Você é fumante?', true),
      (1, 4, 'Qual a sua cor?', true),
      (1, 5, 'Você já mestruou?', true),
      (1, 6, 'Com que idade você teve seu primeiro filho?', true),
      (1, 7, 'Você tem parentes com câncer de ovário?', true),
      (1, 8, 'Com qual idade ocorreu a sua primeira mentruação?', true),
      (1, 9, 'Quantas vezes você fez biópsias mamárias?', true),
      (1, 10, 'Já teve Hiperplásia Atípica?', true),
      (1, 11, 'Screening Mamográfico?', true),
      (1, 12, 'CIS em biópsia?', true),
      (1, 13, 'Qual seu consumo diário de álcool?', true),
      (1, 14, 'Qual é a sua densidade mamográfica', true),
      (1, 15, 'Faz uso do Tamoxifeno?', true),
      (1, 16, 'Faz uso contraceptivo oral?', true),
      (1, 17, 'Com que idade começou a usar?', true),
      (1, 18, 'Número de parentes de 1ºGrau com câncer de mama:', true);
    SQL
  end

  def down
  end

end
