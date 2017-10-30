class Category < ActiveRecord::Base
  validates :external_id, :uniqueness => true

end
