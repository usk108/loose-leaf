# == Schema Information
#
# Table name: binders
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Binder < ActiveRecord::Base
  has_many :pieces, dependent: :destroy
  has_one :headline
  belongs_to :user

  def update_pieces(keyword)
    params = {q: keyword}
    memos = Memo.search(params).per(365).records
    for memo in memos
      piece = self.pieces.create(date: memo.show_date, html: memo.extract_area(keyword))
      memo.pieces << piece
    end
  end
end
