class CreateMyWines < ActiveRecord::Migration[6.0]
  def change
    create_table :my_wines do |t|
      t.references :wine, null: false, foreign_key: true
      t.references :wine_cellar, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
