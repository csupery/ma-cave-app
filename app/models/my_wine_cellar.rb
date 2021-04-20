class MyWineCellar < ApplicationRecord
  belongs_to :user
  belongs_to :wine_cellar
end
