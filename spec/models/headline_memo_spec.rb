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

require 'rails_helper'

RSpec.describe HeadlineMemo, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
