class RemoveReferenceformstocks < ActiveRecord::Migration[6.0]
  def change
    remove_reference :stocks, :my_wine, null: false, foreign_key: true
    add_reference :stocks, :wine, null: false, foreign_key: true

  end
end
