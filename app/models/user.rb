class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:name]
         
  validates_uniqueness_of :name
  validates_presence_of :name
         
  has_many :books, dependent: :destroy
  
end
