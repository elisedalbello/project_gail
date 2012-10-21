# == Schema Information
#
# Table name: tb_paciente
#
#  id_paciente     :integer          not null, primary key
#  id_endereco     :integer          not null
#  id_escolaridade :integer          not null
#  nm_paciente     :string(60)
#  dt_nascimento   :datetime
#  idade           :integer
#  naturalidade    :string(60)
#  nr_rg           :string(20)
#  convenio        :boolean
#  ds_convenio     :string(60)
#  fg_ativo        :integer
#

class Paciente < ActiveRecord::Base
  
  set_table_name "tb_paciente"
  set_primary_key "id_paciente"
  
  #Relacionamentos
  has_one :escolaridade
  has_one :endereco
  has_one :paciente_resposta
  
  attr_accessible :nm_paciente, :idade,:dt_nascimento, :naturalidade, :nr_rg,:convenio, :ds_convenio, :fg_ativo,:id_escolaridade
 
  validates :idade,  :presence => true

end
