# == Schema Information
#
# Table name: headlines
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  binder_id  :integer
#

FactoryGirl.define do
  factory :headline do
    name "MyString"
user_id 1
  end

end
