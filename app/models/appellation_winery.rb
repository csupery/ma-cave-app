class AppellationWinery < ApplicationRecord
  belongs_to :winery
  belongs_to :appellation
  has_many :wines, dependent: :destroy
end
