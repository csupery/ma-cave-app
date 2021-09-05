class Wine < ApplicationRecord
  belongs_to :appellation_winery
  has_many :my_wines, dependent: :destroy
  has_many :stocks, dependent: :destroy



  enum wine_type: WINE_TYPE

  validates :name, presence: true
  validates :wine_type, presence: true
end
