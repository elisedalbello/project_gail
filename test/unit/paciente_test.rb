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

require 'test_helper'

class PacienteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
