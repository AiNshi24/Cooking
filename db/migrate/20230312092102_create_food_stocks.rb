class CreateFoodStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :food_stocks do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.text :memo
      t.timestamps
    end
  end
end
