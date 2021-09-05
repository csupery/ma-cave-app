class Winery < ApplicationRecord
  has_many :appellation_wineries, dependent: :destroy, inverse_of: :winery
  has_many :appellations, through: :appellation_wineries
  has_many :my_wineries
  has_many :stocks

  accepts_nested_attributes_for :appellations

  validates :name, presence: true
end
