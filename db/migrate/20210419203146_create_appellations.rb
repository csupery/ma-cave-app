class CreateAppellations < ActiveRecord::Migration[6.0]
  def change
    create_table :appellations do |t|
      t.string :name
      t.string :location
      t.references :winery, null: false, foreign_key: true

      t.timestamps
    end
  end
end
