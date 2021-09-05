class MyWineCellar < ApplicationRecord
  belongs_to :user
  belongs_to :wine_cellar
  has_many :my_wineries, dependent: :destroy
  has_many :stocks, dependent: :destroy

end
