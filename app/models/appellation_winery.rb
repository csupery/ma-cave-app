class AppellationWinery < ApplicationRecord
  belongs_to :winery, optional: false
  belongs_to :appellation
  has_many :wines, dependent: :destroy

  accepts_nested_attributes_for :winery
end
