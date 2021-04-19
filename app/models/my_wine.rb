class MyWine < ApplicationRecord
  belongs_to :wine
  belongs_to :wine_cellar
  has_many :stocks, dependent: :destroy
end
