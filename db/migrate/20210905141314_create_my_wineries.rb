class CreateMyWineries < ActiveRecord::Migration[6.0]
  def change
    create_table :my_wineries do |t|
      t.references :my_wine_cellar, null: false, foreign_key: true
      t.references :winery, null: false, foreign_key: true

      t.timestamps
    end
  end
end
