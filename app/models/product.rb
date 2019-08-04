class Product < ApplicationRecord

  validates :name, presence: true
  validates :price, numericality: true

  has_many :order_items
  belongs_to :category

  mount_uploader :image, ProductUploader
end
