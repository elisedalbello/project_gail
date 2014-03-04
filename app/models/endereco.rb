# == Schema Information
#
# Table name: tb_enderecos
#
#  id          :integer          not null
#  estado_id   :integer          not null
#  rua         :string(60)
#  nr          :string(10)
#  complemento :string(60)
#  bairro      :string(60)
#  cep         :string(10)
#  cidade      :string(60)
#  fg_ativo    :boolean          not null
#

class Endereco < ActiveRecord::Base

  self.table_name = "tb_enderecos"

  belongs_to :paciente

  attr_accessible :rua, :nr, :bairro, :complemento, :cidade, :cep, :estado_id, :fg_ativo

end
