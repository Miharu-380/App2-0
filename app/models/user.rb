class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:name]
  
  has_many :books, dependent: :destroy
  
  validates_uniqueness_of :name
  validates :name, presence: true
  
  attachment :profile_image
end
