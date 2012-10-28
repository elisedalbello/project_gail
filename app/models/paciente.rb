# == Schema Information
#
# Table name: tb_pacientes
#
#  id              :integer          not null
#  endereco_id     :integer          not null
#  escolaridade_id :integer          not null
#  nm_paciente     :string(60)
#  dt_nascimento   :datetime
#  idade           :integer
#  naturalidade    :string(60)
#  nr_rg           :string(20)
#  convenio        :boolean
#  ds_convenio     :string(60)
#  fg_ativo        :boolean          not null
#

class Paciente < ActiveRecord::Base
  
  set_table_name "tb_pacientes"
  
  #Relacionamentos
  has_one :escolaridade
  has_one :endereco
  has_one :paciente_resposta
  
  attr_accessible :nm_paciente, :idade, :dt_nascimento, :naturalidade, :nr_rg, :convenio, :ds_convenio, :fg_ativo, :escolaridade_id
 
  validates :idade,  :presence => true

end
