class CreateWineCellars < ActiveRecord::Migration[6.0]
  def change
    create_table :wine_cellars do |t|
      t.string :name
      t.string :token

      t.timestamps
    end
  end
end
