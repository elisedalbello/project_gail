# == Schema Information
#
# Table name: tb_estado
#
#  id_estado :integer          not null, primary key
#  ds_estado :string(60)
#  sigla     :string(2)
#  fg_ativo  :integer
#

class Estado < ActiveRecord::Base

  set_table_name "tb_estado"
  set_primary_key "id_estado"

  has_many :endereco

end
