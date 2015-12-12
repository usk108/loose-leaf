class AddColumnHeadlineIdToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :headline_id, :integer
  end
end
