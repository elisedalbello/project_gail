# == Schema Information
#
# Table name: tb_avaliacoes
#
#  id        :integer          not null
#  descricao :string(60)       not null
#  fg_ativo  :boolean          not null
#

class Avaliacao < ActiveRecord::Base

  self.table_name = "tb_avaliacoes"

  has_many :questoes, :conditions => "fg_ativo = true"

  attr_accessible :descricao, :fg_ativo

  def self.calcula_indice_gail(paciente_id)
    sql = "SELECT * FROM indice_gail(%d) as indice_gail" % paciente_id
    connection = ActiveRecord::Base.connection
    result = connection.select_one(sql)
    result["indice_gail"]
  end

end
