class HomeController < ApplicationController
  def index
    @categories = Category.where(parent_id: nil)
    @recommended_items = Product.order('created_at DESC').limit(9)
    @newest_items = Product.order('created_at DESC').limit(5)
    @order_item = current_order.order_items.new
  end
end
