class Winery < ApplicationRecord
  has_many :appellation_wineries, dependent: :destroy, inverse_of: :winery
  has_many :appellations, through: :appellation_wineries

  accepts_nested_attributes_for :appellations, :allow_destroy => true

  validates :name, presence: true
end
