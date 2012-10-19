class FgAtivoDefault < ActiveRecord::Migration

  def up
    execute <<-SQL
      ALTER TABLE tb_paciente_resposta
      ADD COLUMN fg_ativo INTEGER DEFAULT 1;
    SQL
  end

  def down
  end

end
