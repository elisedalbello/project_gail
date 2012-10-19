# coding: UTF-8

class CreateTbQuestoes < ActiveRecord::Migration

  def up
    execute <<-SQL
      CREATE TABLE tb_questao(
        id_avaliacao INTEGER NOT NULL,
        sq_questao   INTEGER NOT NULL,
        ds_questao   TEXT,
        fg_ativo     INTEGER,
        PRIMARY KEY(sq_questao, id_avaliacao),
        CONSTRAINT FK_TB_QUESTOES
        FOREIGN KEY(id_avaliacao) REFERENCES tb_avaliacao(id_avaliacao)
      );

      INSERT INTO tb_questao(id_avaliacao, sq_questao, ds_questao, fg_ativo)
      VALUES
      (1, 1, 'Você faz reposição hormonal?', 1),
      (1, 2, 'Há quanto tempo?', 1),
      (1, 3, 'Você é fumante?', 1),
      (1, 4, 'Qual a sua cor?', 1),
      (1, 5, 'Você já mestruou?', 1),
      (1, 6, 'Com que idade você teve seu primeiro filho?', 1),
      (1, 7, 'Vocẽ tem parentes com câncer de ovário?', 1),
      (1, 8, 'Com qual idade ocorreu a sua primeira mentruação?', 1),
      (1, 9, 'Quantas vezes você fez biópsias mamárias?', 1),
      (1, 10, 'Já teve Hiperplásia Atípica?', 1),
      (1, 11, 'Screening Mamográfico?', 1),
      (1, 12, 'CSI em biópsia?', 1),
      (1, 13, 'Qual seu consumo diário de álcool?', 1),
      (1, 14, 'Qual é a sua densidade mamográfica', 1),
      (1, 15, 'Faz uso do Tamoxifeno?', 1),
      (1, 16, 'Faz uso contraceptivo oral?', 1),
      (1, 17, 'Com que idade começou a usar?', 1),
      (1, 18, 'Número de parentes de 1ºGrau com cancer de mama:', 1);
    SQL
  end

  def down
  end

end
