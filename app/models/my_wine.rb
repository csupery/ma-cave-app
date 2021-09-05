class MyWine < ApplicationRecord
  belongs_to :wine
  belongs_to :my_wine_cellar
end
