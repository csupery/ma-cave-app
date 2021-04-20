class AddAppellationWineryToWine < ActiveRecord::Migration[6.0]
  def change
    add_reference :wines, :appellation_winery, null: false, foreign_key: true
  end
end
