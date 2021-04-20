class CreateWines < ActiveRecord::Migration[6.0]
  def change
    create_table :wines do |t|
      t.integer :wine_type
      t.references :appellation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
