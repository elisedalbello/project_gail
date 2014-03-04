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

  self.table_name = "tb_pacientes"

  attr_accessible :nm_paciente, :idade, :dt_nascimento, :naturalidade, :nr_rg, :convenio, :ds_convenio, :fg_ativo, :escolaridade_id
  
  #Relacionamentos
  has_one :escolaridade
  belongs_to :endereco
  has_many :paciente_resposta, :class_name => "PacienteResposta"
  has_many :avaliacoes, :through => :paciente_resposta

  validates :ds_convenio, :presence => true, :if => :has_convenio?
  validates :idade, :presence => true

  def has_convenio?
      self.convenio
  end

end
