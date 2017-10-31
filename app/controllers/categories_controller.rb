require 'rest-client'
class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @categories = Kaminari.paginate_array(@categories).page(params[:page]).per(30)
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      respond_to do |format|
        format.html { redirect_to crawl_categories_categories_path, notice: 'Added category successfully.'}
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to crawl_categories_categories_path, notice: 'Added category unsuccessfully.'}
        format.js
      end
    end
  end

  def crawl_categories
    response = RestClient.get "https://api.indix.com/v2/categories?app_key=#{ENV['APP_KEY']}"
    @categories = []
    JSON.parse(response)['result']['categories'].each do |item|
      if item['id'] != nil && item['name'] != nil
        u = { external_id: item['id'], name: item['name'], name_path: item['namePath'], id_path: item['idPath'] }
        @categories << u
      end
    end
    @categories = Kaminari.paginate_array(@categories).page(params[:page]).per(30)
  end

  private

    def category_params
        params.require(:category).permit(:name, :name_path, :id_path, :external_id)
    end
end

