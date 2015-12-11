# == Schema Information
#
# Table name: binders
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  headline_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Binder < ActiveRecord::Base
  has_many :pieces
  has_one :headline
  belongs_to :user

end
