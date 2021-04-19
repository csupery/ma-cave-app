class AddNameToWines < ActiveRecord::Migration[6.0]
  def change
    add_column :wines, :name, :string
  end
end
