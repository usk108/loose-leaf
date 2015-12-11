# == Schema Information
#
# Table name: pieces
#
#  id         :integer          not null, primary key
#  html       :text(65535)
#  date       :datetime
#  binder_id  :integer
#  memo_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :piece do
    html "MyText"
date "2015-12-11 21:03:44"
binder_id 1
memo_id 1
  end

end
