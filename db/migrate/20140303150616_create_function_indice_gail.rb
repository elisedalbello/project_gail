class CreateFunctionIndiceGail < ActiveRecord::Migration
  def up
    execute <<-SQL

        CREATE OR REPLACE FUNCTION indice_gail(PACIENTE INTEGER) RETURNS numeric AS $$
            DECLARE
                alt_idade tb_pacientes.idade%TYPE;
                alt_cor tb_pacientes_respostas.alternativa_id%TYPE;
                alt_menarca tb_pacientes_respostas.alternativa_id%TYPE;
                alt_biopsia tb_pacientes_respostas.alternativa_id%TYPE;
                alt_hiperplasia tb_pacientes_respostas.alternativa_id%TYPE;
                alt_primeiro_filho tb_pacientes_respostas.alternativa_id%TYPE;
                alt_nro_parentes tb_pacientes_respostas.alternativa_id%TYPE;
                cor_idade NUMERIC;
                menarca NUMERIC;
                biopsia NUMERIC;
                hiperplasia NUMERIC;
                primeiro_filho_nro_parentes NUMERIC;
                RESULTADO NUMERIC;
            BEGIN
                SELECT INTO alt_idade idade FROM TB_PACIENTES WHERE ID = PACIENTE;

                -- RELACIONAR COR E IDADE --------------------------------------------------------------------------------------
                SELECT INTO alt_cor alternativa_id FROM TB_PACIENTES_RESPOSTAS WHERE PACIENTE_ID = PACIENTE AND QUESTAO_ID = 1 AND AVALIACAO_ID = 1;

                -- 1 - BRANCA | 2 - PRETA
                IF alt_cor = 1 AND alt_idade BETWEEN 20 AND 24 THEN
                      cor_idade := 0.012;
                ELSIF alt_cor = 1 AND alt_idade BETWEEN 25 AND 29 THEN
                      cor_idade := 0.049;
                ELSIF alt_cor = 1 AND alt_idade BETWEEN 30 AND 34 THEN
                      cor_idade := 0.134;
                ELSIF alt_cor = 1 AND alt_idade BETWEEN 35 AND 39 THEN
                      cor_idade := 0.278;
                ELSIF alt_cor = 1 AND alt_idade BETWEEN 40 AND 49 THEN
                      cor_idade := 0.584;
                ELSIF alt_cor = 1 AND alt_idade BETWEEN 50 AND 54 THEN
                      cor_idade := 0.703;
                ELSIF alt_cor = 1 AND alt_idade BETWEEN 55 AND 59 THEN
                      cor_idade := 0.859;
                ELSIF alt_cor = 1 AND alt_idade BETWEEN 60 AND 64 THEN
                      cor_idade := 1.018;
                ELSIF alt_cor = 1 AND alt_idade BETWEEN 65 AND 69 THEN
                      cor_idade := 1.116;
                ELSIF alt_cor = 1 AND alt_idade BETWEEN 70 AND 74 THEN
                      cor_idade := 1.157;
                ELSIF alt_cor = 1 AND alt_idade BETWEEN 75 AND 79 THEN
                      cor_idade := 1.140;
                ELSIF alt_cor = 1 AND alt_idade >= 80 THEN
                      cor_idade := 1.006;
                ELSIF alt_cor = 2 AND alt_idade BETWEEN 20 AND 24 THEN
                      cor_idade := 0.014;
                ELSIF alt_cor = 2 AND alt_idade BETWEEN 25 AND 29 THEN
                      cor_idade := 0.050;
                ELSIF alt_cor = 2 AND alt_idade BETWEEN 30 AND 34 THEN
                      cor_idade := 0.120;
                ELSIF alt_cor = 2 AND alt_idade BETWEEN 35 AND 39 THEN
                      cor_idade := 0.224;
                ELSIF alt_cor = 2 AND alt_idade BETWEEN 40 AND 44 THEN
                      cor_idade := 0.310;
                ELSIF alt_cor = 2 AND alt_idade BETWEEN 45 AND 49 THEN
                      cor_idade := 0.355;
                ELSIF alt_cor = 2 AND alt_idade BETWEEN 50 AND 54 THEN
                      cor_idade := 0.416;
                ELSIF alt_cor = 2 AND alt_idade BETWEEN 55 AND 59 THEN
                      cor_idade := 0.511;
                ELSIF alt_cor = 2 AND alt_idade BETWEEN 60 AND 64 THEN
                      cor_idade := 0.562;
                ELSIF alt_cor = 2 AND alt_idade BETWEEN 65 AND 69 THEN
                      cor_idade := 0.586;
                ELSIF alt_cor = 2 AND alt_idade BETWEEN 70 AND 74 THEN
                      cor_idade := 0.646;
                ELSIF alt_cor = 2 AND alt_idade BETWEEN 75 AND 79 THEN
                      cor_idade := 0.713;
                ELSIF alt_cor = 2 AND alt_idade >= 80 THEN
                      cor_idade := 0.659;
                END IF;

                -- IDADE EM QUE OCORREU A MENARCA ---------------------------------------------------------------------------------
                SELECT INTO alt_menarca alternativa_id FROM TB_PACIENTES_RESPOSTAS WHERE PACIENTE_ID = PACIENTE AND QUESTAO_ID = 2 AND AVALIACAO_ID = 1;

                IF alt_menarca = 1 THEN --MAIOR OU IGUAL 14 ANOS
                    menarca := 1.0;
                ELSIF alt_menarca = 2 THEN --ENTRE 12 E 13 ANOS
                    menarca := 1.10;
                ELSIF alt_menarca = 3 THEN --MENOR QUE 12 ANOS
                    menarca := 1.21;
                END IF;

                -- IDADE COM QUE TEVE O PRIMEIRO FILHO RELACIONADA AO NUMERO DE PARENTES COM CANCER DE MAMA ----------------------
                SELECT INTO alt_primeiro_filho alternativa_id FROM TB_PACIENTES_RESPOSTAS WHERE PACIENTE_ID = PACIENTE AND QUESTAO_ID = 3 AND AVALIACAO_ID = 1;

                SELECT INTO alt_nro_parentes alternativa_id FROM TB_PACIENTES_RESPOSTAS WHERE PACIENTE_ID = PACIENTE AND QUESTAO_ID = 6 AND AVALIACAO_ID = 1;

                IF alt_primeiro_filho = 1 THEN --NAO TEM FILHOS O QUE COLOCAR?????
                    primeiro_filho_nro_parentes := 1.0;
                ELSIF alt_primeiro_filho = 2 AND alt_nro_parentes = 1 THEN
                    primeiro_filho_nro_parentes := 1.00; --NENHUM PARENTE COM CANCER DE MAMA
                ELSIF alt_primeiro_filho = 2 AND alt_nro_parentes = 2 THEN
                    primeiro_filho_nro_parentes := 2.61; -- 1 PARENTE COM CANCER DE MAMA
                ELSIF alt_primeiro_filho = 2 AND alt_nro_parentes = 3 THEN
                    primeiro_filho_nro_parentes := 6.80; -- 2 OU MAIS PARENTES COM CANCER DE MAMA
                ELSIF alt_primeiro_filho = 3 AND alt_nro_parentes = 1 THEN
                    primeiro_filho_nro_parentes := 1.24; --NENHUM PARENTE COM CANCER DE MAMA
                ELSIF alt_primeiro_filho = 3 AND alt_nro_parentes = 2 THEN
                    primeiro_filho_nro_parentes := 2.68; -- 1 PARENTE COM CANCER DE MAMA
                ELSIF alt_primeiro_filho = 3 AND alt_nro_parentes = 3 THEN
                    primeiro_filho_nro_parentes := 5.78; -- 2 OU MAIS PARENTES COM CANCER DE MAMA
                ELSIF alt_primeiro_filho = 4 AND alt_nro_parentes = 1 THEN
                    primeiro_filho_nro_parentes := 1.55; --NENHUM PARENTE COM CANCER DE MAMA
                ELSIF alt_primeiro_filho = 4 AND alt_nro_parentes = 2 THEN
                    primeiro_filho_nro_parentes := 2.76; --1 PARENTE COM CANCER DE MAMA
                ELSIF alt_primeiro_filho = 4 AND alt_nro_parentes = 3 THEN
                    primeiro_filho_nro_parentes := 4.91; --2 OU MAIS PARENTES COM CANCER DE MAMA
                ELSIF alt_primeiro_filho = 5 AND alt_nro_parentes = 1 THEN
                    primeiro_filho_nro_parentes := 1.93; --NENHUM PARENTE COM CANCER DE MAMA
                ELSIF alt_primeiro_filho = 5 AND alt_nro_parentes = 2 THEN
                    primeiro_filho_nro_parentes := 2.83; --1 PARENTE COM CANCER DE MAMA
                ELSIF alt_primeiro_filho = 5 AND alt_nro_parentes = 3 THEN
                    primeiro_filho_nro_parentes := 4.17; --2 OU MAIS PARENTES COM CANCER DE MAMA
                END IF;

                -- NUMERO DE BIOPSIAS --------------------------------------------------------------------------------------------
                SELECT INTO alt_biopsia alternativa_id FROM TB_PACIENTES_RESPOSTAS WHERE PACIENTE_ID = PACIENTE AND QUESTAO_ID = 4 AND AVALIACAO_ID = 1;

                IF alt_idade < 50 AND alt_biopsia = 1  THEN --NENHUMA BIOPSIA
                    biopsia := 1.00;
                ELSIF alt_idade < 50 AND alt_biopsia = 2 THEN --1 BIOPSIA
                    biopsia := 1.7;
                ELSIF alt_idade < 50 AND alt_biopsia = 3 THEN --2 OU MAIS BIOPSIAS
                    biopsia := 2.88;
                ELSIF alt_idade >= 50 AND alt_biopsia = 1  THEN --NENHUMA BIOPSIA
                    biopsia := 1.00;
                ELSIF alt_idade >= 50 AND alt_biopsia = 2 THEN --1 BIOPSIA
                    biopsia := 1.27;
                ELSIF alt_idade >= 50 AND alt_biopsia = 3 THEN --2 OU MAIS BIOPSIAS
                    biopsia := 1.62;
                END IF;

                --HIPERPLASIA ATIPICA -----------------------------------------------------------------------------------------------
                SELECT INTO alt_hiperplasia alternativa_id FROM TB_PACIENTES_RESPOSTAS WHERE PACIENTE_ID = PACIENTE AND QUESTAO_ID = 5 AND AVALIACAO_ID = 1;

                IF alt_hiperplasia = 1 THEN --NENHUMA BIOPSIA
                    hiperplasia := 1.00;
                ELSIF alt_hiperplasia = 2 THEN --PELO MENOS UMA BIOPSIA SEM HIPERPLASIA ATIPICA
                    hiperplasia := 0.93;
                ELSIF alt_hiperplasia = 3 THEN --SEM HIPERPLASIA ATIPICA E DESCONHECIDO ESTADO DE HIPERPLASIA
                    hiperplasia := 1.00;
                ELSIF alt_hiperplasia = 4 THEN --HIPERPLASIA ATIPICA EM PELO MENOS UMA BIOPSIA
                    hiperplasia := 1.82;
                END IF;
                ---------------------------------------------------------------------------------------------------------------------
                RESULTADO := menarca * biopsia * primeiro_filho_nro_parentes * cor_idade * hiperplasia;

                INSERT INTO tb_resultado(paciente_id, resultado, data_gravacao, avaliacao_id) VALUES(PACIENTE, RESULTADO, NOW(), 1);

                RETURN RESULTADO;
            END;
        $$ LANGUAGE plpgsql;
    SQL
  end

  def down
  end
end
