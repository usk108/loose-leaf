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

FactoryGirl.define do
  factory :headline_memo do
    headline_id 1
memo_id 1
  end

end
