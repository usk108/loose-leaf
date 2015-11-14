# == Schema Information
#
# Table name: memos
#
#  id         :integer          not null, primary key
#  date       :datetime
#  text       :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

FactoryGirl.define do
  factory :memo do
    date "2015-11-05 17:38:35"
text "MyText"
  end

end
