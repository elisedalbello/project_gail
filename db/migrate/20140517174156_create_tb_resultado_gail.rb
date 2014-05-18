class CreateTbResultadoGail < ActiveRecord::Migration
  def up
    execute <<-SQL
        CREATE TABLE tb_resultado(
            paciente_id  INTEGER NOT NULL,
            avaliacao_id INTEGER,
            resultado NUMERIC,
            data_gravacao TIMESTAMP,
            PRIMARY KEY(paciente_id, data_gravacao)
        );
    SQL
  end

  def down
  end
end
