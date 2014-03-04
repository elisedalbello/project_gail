class CreateFunctionIndiceGail < ActiveRecord::Migration
  def up
    execute <<-SQL

        CREATE OR REPLACE FUNCTION INDICE_GAIL(PACIENTE INTEGER) RETURNS NUMERIC AS $$
            BEGIN
                IF paciente = 1 THEN
                    RETURN 11111111;
                ELSIF paciente = 2 THEN
                    RETURN 222222222;
                ELSE
                    RETURN 0;
                END IF;
            END;
        $$ LANGUAGE PLPGSQL;

    SQL
  end

  def down
  end
end
