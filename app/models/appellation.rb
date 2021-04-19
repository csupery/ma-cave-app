class Appellation < ApplicationRecord
  has_many :appellation_wineries, dependent: :destroy
  has_many :wineries, through: :appellation_to_wineries
end
