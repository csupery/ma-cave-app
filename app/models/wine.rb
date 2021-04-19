class Wine < ApplicationRecord
  belongs_to :appellation_winery

  validates :name, presence: true
  validates :wine_type, presence: true
end
