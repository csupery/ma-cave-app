class MyWineCellar < ApplicationRecord
  belongs_to :user
  belongs_to :wine_cellar
  has_many :my_wines, dependent: :destroy
end
