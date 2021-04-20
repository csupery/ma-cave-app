class WineCellar < ApplicationRecord
  has_many :my_wines, dependent: :destroy
  has_many :my_wine_cellars, dependent: :destroy
  has_many :users, through: :my_wine_cellars

  validates :name, presence: true

  before_create :generate_token

  private

  def generate_token
    self.token = loop do
      random_token = SecureRandom.alphanumeric(10)
      break random_token unless WineCellar.exists?(token: random_token)
    end
  end
end
