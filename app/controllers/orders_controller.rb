class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :edit]

  def index
    @orders = Order.all
    @orders = Kaminari.paginate_array(@orders).page(params[:page]).per(30)
  end

  def show
    @order_items = @order.order_items
  end

  def show_by_user
    @orders = Order.where(user_id: current_user.id)
  end

  def new
    @order = Order.new
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    if @order.update_attributes(order_params)
      redirect_to orders_path, notice: 'Updated order status successfully.'
    else
      render :edit
    end
  end

  private

    def order_params
      params.require(:order).permit(:order_status)
    end

    def set_order
      @order = Order.find(params[:id])
    end

end
