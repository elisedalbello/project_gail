#coding: UTF-8

class IdPacienteSerial < ActiveRecord::Migration
  def up
    execute <<-SQL
      ALTER TABLE tb_paciente
      ALTER COLUMN id_paciente SERIAL;
    SQL
  end

  def down
  end
end
