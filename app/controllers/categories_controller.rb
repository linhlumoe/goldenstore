class CategoriesController < ApplicationController
  before_action :set_categories, only: [:new, :edit]
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
    @categories = Kaminari.paginate_array(@categories).page(params[:page]).per(30)
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: 'Added category successfully.'
    else
      set_categories
      flash[:alert] = 'Added category unsuccessfully.'
      render :new
    end
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def update
    if @category.update_attributes(category_params)
      # Handle a successful update.
      redirect_to categories_path, notice: 'Updated category successfully.'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: 'Deleted category successfully.'
  end

  private

    def category_params
        params.require(:category).permit(:name, :parent_id)
    end

    def set_category
      @category = Category.find(params[:id])
    end

    def set_categories
      @categories = Category.all
    end
end

