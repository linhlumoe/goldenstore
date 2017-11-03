module ProductsHelper
  def product_exist?(title)
    product = Product.find_by(title: title)
    product ? true : false
  end
end
