class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.text :html
      t.datetime :date
      t.integer :binder_id
      t.integer :memo_id

      t.timestamps null: false
    end
  end
end
