class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items, dependent: :destroy
  before_create :set_order_status
  before_save :update_subtotal

  def subtotal
    order_items.collect { |item| item.valid? ? (item.unit_price * item.quantity) : 0 }.sum
  end

  private

    def set_order_status
      self.order_status = 'In Progress'
      self.tax = 0
      self.shipping = 0
    end

    def update_subtotal
      self.subtotal = subtotal
      self.total = self.subtotal
    end

end
