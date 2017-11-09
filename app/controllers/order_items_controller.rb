class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    @order.user = current_user unless @order.user
    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    if @order_item.update_attributes(order_item_params)
      flash[:notice] = 'Update quantity successfully.'
    else
      flash[:alert] = 'Update quantity unsuccessfully.'
    end
    @order_items = @order.order_items
    redirect_to cart_path
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    if @order_item.destroy
      flash[:notice] = 'Delete product successfully.'
    else
      flash[:alert] = 'Delete product unsuccessfully.'
    end
    @order_items = @order.order_items
    redirect_to cart_path
  end

  private

    def order_item_params
      params.require(:order_item).permit(:quantity, :product_id)
    end
end
