class RemoveAppellationFromWine < ActiveRecord::Migration[6.0]
  def change
    remove_reference :wines, :appellation, null: false, foreign_key: true
  end
end
