class RemoveWineCellarFromMyWines < ActiveRecord::Migration[6.0]
  def change
    remove_reference :my_wines, :wine_cellar, null: false, foreign_key: true
  end
end
