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

class Memo < ActiveRecord::Base
  validates :text, presence: true
  belongs_to :user

  include Elasticsearch::Model

  index_name "memo_#{Rails.env}" #インデックス名を指定

  def show_date
    "#{self.date.year}年#{self.date.month}月#{self.date.day}日"
  end
end
