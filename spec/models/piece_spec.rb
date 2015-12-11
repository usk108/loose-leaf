# == Schema Information
#
# Table name: pieces
#
#  id         :integer          not null, primary key
#  html       :text(65535)
#  date       :string(255)
#  binder_id  :integer
#  memo_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Piece, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
