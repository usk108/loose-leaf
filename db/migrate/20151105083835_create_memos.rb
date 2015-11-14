class CreateMemos < ActiveRecord::Migration
  def change
    create_table :memos do |t|
      t.datetime :date
      t.text :text

      t.timestamps null: false
    end
  end
end
