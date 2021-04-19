class CreateAppellationWineries < ActiveRecord::Migration[6.0]
  def change
    create_table :appellation_wineries do |t|
      t.references :winery, null: false, foreign_key: true
      t.references :appellation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
