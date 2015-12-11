class ChangeColumnToPiece < ActiveRecord::Migration
  # 変更内容
  def up
    change_column :pieces, :date, :string
  end

  # 変更前の状態
  def down
    change_column :pieces, :date, :datetime
  end
end
