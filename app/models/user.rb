class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments, dependent: :destroy
  belongs_to :role

  validates :name, :email, :role_id, presence: true
end
