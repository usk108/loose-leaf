class AddBinderIdToHeadlines < ActiveRecord::Migration
  def change
    add_column :headlines, :binder_id, :integer
  end
end
