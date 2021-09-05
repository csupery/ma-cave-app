class AddMyWineCellarInStock < ActiveRecord::Migration[6.0]
  def change
    add_reference :stocks, :my_wine_cellar, null: false, foreign_key: true
  end
end
