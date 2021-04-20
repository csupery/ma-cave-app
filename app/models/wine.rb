class Wine < ApplicationRecord
  belongs_to :appellation_winery

  enum size: WINE_TYPE

  validates :name, presence: true
  validates :wine_type, presence: true
end
