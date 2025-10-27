class Book < ApplicationRecord
  belongs_to :category
  has_many :comments, dependent: :destroy

  has_one_attached :cover_image

  enum flag: { common: 0, hot: 1, new_arival: 2, best_seller: 3 }

  validates :name, :price, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at id name updated_at created_at price rating]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[category]
  end
end
