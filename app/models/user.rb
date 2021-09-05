class User < ApplicationRecord
  has_many :my_wine_cellars, dependent: :destroy
  has_many :wine_cellar, through: :my_wine_cellars
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
