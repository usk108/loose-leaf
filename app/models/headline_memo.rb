# == Schema Information
#
# Table name: headline_memos
#
#  id          :integer          not null, primary key
#  headline_id :integer
#  memo_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class HeadlineMemo < ActiveRecord::Base
  belongs_to :headline
  belongs_to :memo
end
