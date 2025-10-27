class User < ApplicationRecord
  belongs_to :role
  has_many :comments, dependent: :destroy
  has_many :wishlists, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :email, :role_id, presence: true
end
