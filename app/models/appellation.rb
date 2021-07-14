class Appellation < ApplicationRecord
  has_many :appellation_wineries, dependent: :destroy
  has_many :wineries, through: :appellation_to_wineries
  has_many :wines, through: :appellation_wineries

  validates :name, presence: true
  validates :location, presence: true

end
