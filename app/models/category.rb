class Category < ActiveRecord::Base
  has_many :product, dependent: :destroy
  has_many :subcategories, class_name: 'Category', foreign_key: :parent_id, dependent: :destroy
  belongs_to :parent, class_name: 'Category'
  validates :name, uniqueness: true, presence: true
  default_scope    { order(:created_at) }
  scope :roots, -> { where(parent_id: nil) }
end
