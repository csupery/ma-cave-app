class Stock < ApplicationRecord
  belongs_to :wine
  belongs_to :my_wine_cellar
  belongs_to :winery

  enum size: SIZE

  validates :quantity, presence: true
  validates :size, presence: true
  validates :vintage, presence: true
end
