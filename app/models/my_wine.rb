class MyWine < ApplicationRecord
  belongs_to :wine
  belongs_to :wine_cellar
end
