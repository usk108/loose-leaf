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

require 'rails_helper'

RSpec.describe Memo, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
