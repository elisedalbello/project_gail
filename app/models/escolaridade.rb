# == Schema Information
#
# Table name: tb_escolaridades
#
#  id              :integer          not null
#  ds_escolaridade :string(40)
#  fg_ativo        :boolean          not null
#

class Escolaridade < ActiveRecord::Base

  self.table_name = "tb_escolaridades"

  has_many :pacientes, :conditions => "fg_ativo = true"

end
