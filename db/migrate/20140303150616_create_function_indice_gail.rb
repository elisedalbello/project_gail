class CreateFunctionIndiceGail < ActiveRecord::Migration
  def up
    execute <<-SQL

        # CREATE OR REPLACE FUNCTION INDICE_GAIL(AVALIACAO_ID AS INTEGER, PACIENTE AS INTEGER) RETURNS NUMERIC
        #   AS
        #   $$
        #   DECLARE
        #     alt_cor, alt_menarca, alt_biopsia, alt_hiperplasia, alt_primeiro_filho, alt_nro_parentes INTEGER;
        #     cor_idade, menarca, biopsia, hiperplasia, primeiro_filho_nro_parentes RESULTADO NUMERIC;

        #     SELECT IDADE FROM TB_PACIENTES WHERE ID = PACIENTE;

        #   -- RELACIONAR COR E IDADE --------------------------------------------------------------------------------------
        #     SELECT ALTERNATIVA_ID FROM TB_PACIENTES_RESPOSTAS WHERE PACIENTE_ID = PACIENTE AND QUESTAO_ID = 1;
        #     alt_cor = ALTERNATIVA_ID;

        #     IF alt_cor = 1 THEN -- BRANCA
        #       IF IDADE BETWEEN 20 AND 24 THEN
        #         cor_idade= 0.012;
        #       ELSE IF IDADE BETWEEN 25 AND 29 THEN
        #         cor_idade= 0.049;
        #       ELSE IF IDADE BETWEEN 30 AND 34 THEN
        #         cor_idade= 0.134;
        #       ELSE IF IDADE BETWEEN 35 AND 39 THEN
        #         cor_idade= 0.278;
        #       ELSE IF IDADE BETWEEN 40 AND 49 THEN
        #         cor_idade= 0.584;
        #       ELSE IF IDADE BETWEEN 50 AND 54 THEN
        #         cor_idade= 0.703;
        #       ELSE IF IDADE BETWEEN 55 AND 59 THEN
        #         cor_idade= 0.859;
        #       ELSE IF IDADE BETWEEN 60 AND 64 THEN
        #         cor_idade= 1.018;
        #       ELSE IF IDADE BETWEEN 65 AND 69 THEN
        #         cor_idade= 1.116;
        #       ELSE IF IDADE BETWEEN 70 AND 74 THEN
        #         cor_idade= 1.157;
        #       ELSE IF IDADE BETWEEN 75 AND 79 THEN
        #         cor_idade= 1.140;
        #       ELSE IF IDADE BETWEEN 80 AND 84 THEN
        #         cor_idade= 1.006;
        #       END IF
        #     ELSE -- PRETA
        #       IF IDADE BETWEEN 20 AND 24 THEN
        #         cor_idade= 0.014;
        #       ELSE IF IDADE BETWEEN 25 AND 29 THEN
        #         cor_idade= 0.050;
        #       ELSE IF IDADE BETWEEN 30 AND 34 THEN
        #         cor_idade= 0.120;
        #       ELSE IF IDADE BETWEEN 35 AND 39 THEN
        #         cor_idade= 0.224;
        #       ELSE IF IDADE BETWEEN 40 AND 44 THEN
        #         cor_idade= 0.310;
        #       ELSE IF IDADE BETWEEN 45 AND 49 THEN
        #         cor_idade= 0.355;
        #       ELSE IF IDADE BETWEEN 50 AND 54 THEN
        #         cor_idade= 0.416;
        #       ELSE IF IDADE BETWEEN 55 AND 59 THEN
        #         cor_idade= 0.511;
        #       ELSE IF IDADE BETWEEN 60 AND 64 THEN
        #         cor_idade= 0.562;
        #       ELSE IF IDADE BETWEEN 65 AND 69 THEN
        #         cor_idade= 0.586;
        #       ELSE IF IDADE BETWEEN 70 AND 74 THEN
        #         cor_idade= 0.646;
        #       ELSE IF IDADE BETWEEN 75 AND 79 THEN
        #         cor_idade= 0.713;
        #       ELSE IF IDADE BETWEEN 80 AND 84 THEN
        #         cor_idade= 0.659;
        #       END IF
        #     END IF

        #   -- IDADE EM QUE OCORREU A MENARCA ---------------------------------------------------------------------------------
        #     SELECT ALTERNATIVA_ID FROM TB_PACIENTES_RESPOSTAS WHERE PACIENTE_ID = PACIENTE AND QUESTAO_ID = 2;
        #     alt_menarca = ALTERNATIVA_ID;

        #     IF alt_menarca = 1 THEN --MAIOR OU IGUAL 14 ANOS
        #       menarca = 1.0;
        #     ELSE IF alt_menarca = 2 THEN --ENTRE 12 E 13 ANOS
        #       menarca = 1.10;
        #     ELSE IF alt_menarca = 3 THEN --MENOR QUE 12 ANOS
        #       menarca = 1.21;
        #     END IF

        #   -- IDADE COM QUE TEVE O PRIMEIRO FILHO RELACIONADA AO NUMERO DE PARENTES COM CANCER DE MAMA ----------------------
        #     SELECT ALTERNATIVA_ID FROM TB_PACIENTES_RESPOSTAS WHERE PACIENTE_ID = PACIENTE AND QUESTAO_ID = 3;
        #     alt_primeiro_filho = ALTERNATIVA_ID;

        #     SELECT ALTERNATIVA_ID FROM TB_PACIENTES_RESPOSTAS WHERE PACIENTE_ID = PACIENTE AND QUESTAO_ID = 6;
        #     alt_nro_parentes = ALTERNATIVA_ID;

        #     IF alt_primeiro_filho = 1 THEN --NAO TEM FILHOS O QUE COLOCAR?????
        #       primeiro_filho_nro_parentes = 1.0;
        #     ELSE IF alt_primeiro_filho = 2 THEN --MENOS QUE 20 ANOS
        #       IF alt_nro_parentes = 1 THEN
        #         primeiro_filho_nro_parentes = 1.00; --NENHUM PARENTE COM CANCER DE MAMA
        #       ELSE IF alt_nro_parentes = 2 THEN
        #         primeiro_filho_nro_parentes = 2.61; -- 1 PARENTE COM CANCER DE MAMA
        #       ELSE IF alt_nro_parentes = 3 THEN
        #         primeiro_filho_nro_parentes = 6.80; -- 2 OU MAIS PARENTES COM CANCER DE MAMA
        #       END IF
        #     ELSE IF alt_primeiro_filho = 3 THEN -- ENTRE 20 E 24 ANOS
        #       IF alt_nro_parentes = 1 THEN
        #         primeiro_filho_nro_parentes = 1.24; --NENHUM PARENTE COM CANCER DE MAMA
        #       ELSE IF alt_nro_parentes = 2 THEN
        #         primeiro_filho_nro_parentes = 2.68; -- 1 PARENTE COM CANCER DE MAMA
        #       ELSE IF alt_nro_parentes = 3 THEN
        #         primeiro_filho_nro_parentes = 5.78; -- 2 OU MAIS PARENTES COM CANCER DE MAMA
        #       END IF
        #     ELSE IF alt_primeiro_filho = 4 THEN --ENTRE 25 E 29 ANOS
        #       IF alt_nro_parentes = 1 THEN
        #         primeiro_filho_nro_parentes = 1.55; --NENHUM PARENTE COM CANCER DE MAMA
        #       ELSE IF alt_nro_parentes = 2 THEN
        #         primeiro_filho_nro_parentes = 2.76; --1 PARENTE COM CANCER DE MAMA
        #       ELSE IF alt_nro_parentes = 3 THEN
        #         primeiro_filho_nro_parentes = 4.91; --2 OU MAIS PARENTES COM CANCER DE MAMA
        #       END IF
        #     ELSE IF alt_primeiro_filho = 3 THEN --30 ANOS OU MAIS
        #       IF alt_nro_parentes = 1 THEN
        #         primeiro_filho_nro_parentes = 1.93; --NENHUM PARENTE COM CANCER DE MAMA
        #       ELSE IF alt_nro_parentes = 2 THEN
        #         primeiro_filho_nro_parentes = 2.83; --1 PARENTE COM CANCER DE MAMA
        #       ELSE IF alt_nro_parentes = 3 THEN
        #         primeiro_filho_nro_parentes = 4.17; --2 OU MAIS PARENTES COM CANCER DE MAMA
        #       END IF
        #     END IF

        #   -- NUMERO DE BIOPSIAS --------------------------------------------------------------------------------------------
        #     SELECT ALTERNATIVA_ID FROM TB_PACIENTES_RESPOSTAS WHERE PACIENTE_ID = PACIENTE AND QUESTAO_ID = 4
        #     alt_biopsia = ALTERNATIVA_ID;

        #     IF IDADE < 50 THEN
        #       IF alt_biopsia = 1  THEN --NENHUMA BIOPSIA
        #         biopsia = 1.00;
        #       ELSE IF alt_biopsia = 2 THEN --1 BIOPSIA
        #         biopsia = 1.7;
        #       ELSE IF alt_biopsia = 3 THEN --2 OU MAIS BIOPSIAS
        #         biopsia = 2.88;
        #       END IF
        #     ELSE --IDADE MAIOR OU IGUAL A 50 ANOS
        #       IF alt_biopsia = 1  THEN --NENHUMA BIOPSIA
        #         biopsia = 1.00;
        #       ELSE IF alt_biopsia = 2 THEN --1 BIOPSIA
        #         biopsia = 1.27;
        #       ELSE IF alt_biopsia = 3 THEN --2 OU MAIS BIOPSIAS
        #         biopsia = 1.62;
        #       END IF
        #     END IF

        #   --HIPERPLASIA ATIPICA -----------------------------------------------------------------------------------------------
        #     SELECT ALTERNATIVA_ID FROM TB_PACIENTES_RESPOSTAS WHERE PACIENTE_ID = PACIENTE AND QUESTAO_ID = 5
        #     alt_hiperplasia = ALTERNATIVA_ID;

        #     IF alt_hiperplasia = 1 THEN --NENHUMA BIOPSIA
        #       hiperplasia = 1.00;
        #     ELSE IF alt_hiperplasia = 2 THEN --PELO MENOS UMA BIOPSIA SEM HIPERPLASIA ATIPICA
        #       hiperplasia = 0.93;
        #     ELSE IF alt_hiperplasia = 3 THEN --SEM HIPERPLASIA ATIPICA E DESCONHECIDO ESTADO DE HIPERPLASIA
        #       hiperplasia = 1.00;
        #     ELSE IF alt_hiperplasia = 4 THEN --HIPERPLASIA ATIPICA EM PELO MENOS UMA BIOPSIA
        #       hiperplasia = 1.82;
        #     END IF
        #   ---------------------------------------------------------------------------------------------------------------------

        #     RESULTADO = menarca * biopsia * primeiro_filho_nro_parentes * cor_idade * hiperplasia;
        #   END;
        #   $$ LANGUAGE 'plpgsql';

    SQL
  end

  def down
  end
end
