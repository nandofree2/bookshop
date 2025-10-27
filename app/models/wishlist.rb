class Wishlist < ApplicationRecord
  belongs_to :book
  belongs_to :user
  validates :user_id, uniqueness: { scope: :book_id, message: "has already added this book to wishlist" }
end
