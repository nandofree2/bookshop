class Book < ApplicationRecord
  belongs_to :category
  has_many :comments, dependent: :destroy

  has_one_attached :cover_image

  enum flag: { common: 0, hot: 1, new_arival: 2, best_seller: 3 }

  validates :name, :price, presence: true
end
