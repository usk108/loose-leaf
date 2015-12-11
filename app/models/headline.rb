# == Schema Information
#
# Table name: headlines
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Headline < ActiveRecord::Base
  belongs_to :user
  belongs_to :binder
  has_many :headline_memos
  has_many :memos, through: :headline_memos
  has_many :pieces
end
