class HomeController < ApplicationController
  def index
    @categories = Category.where(parent_id: nil)
    @recommended_items = Product.order('created_at DESC').limit(8)
    @newest_items = Product.order('created_at DESC').limit(5)
  end
end
