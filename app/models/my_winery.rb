class MyWinery < ApplicationRecord
  belongs_to :my_wine_cellar
  belongs_to :winery
end
