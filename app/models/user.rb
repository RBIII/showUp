class User < ActiveRecord::Base
  has_many :favorite_bands
  has_many :favorite_venues


  has_many :reviews, dependent: :destroy
  has_many :votes, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


end
