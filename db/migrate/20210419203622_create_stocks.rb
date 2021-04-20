class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.integer :quantity
      t.integer :size
      t.integer :vintage
      t.references :my_wine, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
