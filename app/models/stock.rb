class Stock < ApplicationRecord
  belongs_to :my_wine

  enum size: SIZE
  validates :quantity, presence: true
  validates :size, presence: true
  validates :vintage, presence: true
end
