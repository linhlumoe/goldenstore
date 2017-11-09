class Product < ActiveRecord::Base
  belongs_to :category
  has_many :order_items
  validates :title, presence: true, length: { maximum: 100 }
  validates :brand, presence: true
  validates :description, presence: true, length: { maximum: 1000 }
  validates :price, presence: true
  validates :category_id, presence: true

  mount_uploader :image, ImageUploader

  scope :starts_with, -> (title) { where("title like ?", "%#{title}%") }
end
