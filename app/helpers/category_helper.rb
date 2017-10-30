module CategoryHelper
  def category_exist?(id)
    category = Category.find_by(external_id: id)
    category ? true : false
  end
end
