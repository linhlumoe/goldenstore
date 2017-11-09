class ProductsController < ApplicationController
  load_and_authorize_resource

  before_action :set_categories, only: [:new, :edit]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_order_item, only: [:index, :show]

  def index
    @products = params[:cat_id] ? Product.where(category_id: params[:cat_id]) : Product.all
    @products = Kaminari.paginate_array(@products).page(params[:page]).per(30)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: 'Added product successfully.'
    else
      set_categories
      flash[:alert] = 'Added product unsuccessfully.'
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update_attributes(product_params)
      redirect_to @product, notice: 'Updated product successfully.'
    else
      render :edit
    end
  end

  def show
    @categories = Category.where(parent_id: nil)
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: 'Deleted product successfully.'
  end

  private

    def product_params
      params.require(:product).permit(:title, :brand, :description, :price, :image, :category_id, :author)
    end

    def set_product
      @product = Product.find(params[:id])
    end

    def set_categories
      @categories = Category.all.select{ |sub| sub.subcategories.count == 0 }
    end

    def set_order_item
      @order_item = current_order.order_items.new
    end
end
