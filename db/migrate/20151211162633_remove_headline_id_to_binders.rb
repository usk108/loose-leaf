class RemoveHeadlineIdToBinders < ActiveRecord::Migration
  def change
    remove_column :binders, :headline_id, :integer
  end
end
