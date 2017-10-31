class Category < ActiveRecord::Base
  validates :external_id, uniqueness: true, presence: true
  validates :name, uniqueness: true, presence: true
  validates :name_path, uniqueness: true, presence: true
  validates :id_path, uniqueness: true, presence: true
end
