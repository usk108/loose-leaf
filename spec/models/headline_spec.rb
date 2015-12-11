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

require 'rails_helper'

RSpec.describe Headline, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
