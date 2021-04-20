class CreateMyWineCellars < ActiveRecord::Migration[6.0]
  def change
    create_table :my_wine_cellars do |t|
      t.references :user, null: false, foreign_key: true
      t.references :wine_cellar, null: false, foreign_key: true

      t.timestamps
    end
  end
end
