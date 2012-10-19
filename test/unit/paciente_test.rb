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

require 'test_helper'

class PacienteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
