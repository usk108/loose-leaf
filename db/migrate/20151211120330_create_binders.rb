class CreateBinders < ActiveRecord::Migration
  def change
    create_table :binders do |t|
      t.integer :user_id
      t.integer :headline_id

      t.timestamps null: false
    end
  end
end
