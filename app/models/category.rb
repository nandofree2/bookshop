class Category < ApplicationRecord
  has_many :books, dependent: :destroy
   validates :name, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[id name created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[books]
  end
end
