# == Schema Information
#
# Table name: tb_endereco
#
#  id_endereco :integer          not null, primary key
#  id_estado   :integer          not null
#  rua         :string(60)
#  nr          :string(10)
#  complemento :string(60)
#  bairro      :string(60)
#  cep         :string(10)
#  cidade      :string(60)
#  fg_ativo    :integer
#

class Endereco < ActiveRecord::Base
  
  set_table_name "tb_endereco"
  set_primary_key "id_endereco"
  
  belongs_to :paciente
  belongs_to :estado
  
  attr_accessible :rua, :nr, :bairro, :complemento, :cidade,  :id_estado, :fg_ativo

end
