# == Schema Information
#
# Table name: tb_estados
#
#  id        :integer          not null
#  ds_estado :string(60)
#  sigla     :string(2)
#  fg_ativo  :boolean          not null
#

class Estado < ActiveRecord::Base

  self.table_name = "tb_estados"

end
