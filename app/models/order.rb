class Order < ApplicationRecord
  validates :name, presence: true

  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items


  def valid_order
    self.line_items.each do |line_item|
      product = Product.find(line_item.product_id)
      if product == nil
        errors.add(:no_product, "The product does not exist")
        return false 
      end
      if line_item.quantity > product.stock
        errors.add(:no_stock, "There is not enough stock")
        return false 
      end
    end
    return true
  end

  def reduce_stock
    if self.line_items.empty?
      errors.add(:empty, "No products in order")
      return false
    end
    self.line_items.each do |line_item|
      product = Product.find(line_item.product_id)
      product.update({stock: product.stock - line_item.quantity})
    end
  end
end
