class Winery < ApplicationRecord
  has_many :appellation_wineries, dependent: :destroy
  has_many :appellations, through: :appellation_to_wineries

  validates :name, presence: true
end
