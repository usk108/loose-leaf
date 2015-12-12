class CreateHeadlineMemos < ActiveRecord::Migration
  def change
    create_table :headline_memos do |t|
      t.integer :headline_id
      t.integer :memo_id

      t.timestamps null: false
    end
  end
end
