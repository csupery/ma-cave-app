class WineCellar < ApplicationRecord
  has_many :my_wines, dependent: :destroy
  has_many :my_wine_cellars, dependent: :destroy
  has_many :users, through: :my_wine_cellars

  validates :name, presence: true
end
