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

class Piece < ActiveRecord::Base
  belongs_to :binder
  belongs_to :memo
end
