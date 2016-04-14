class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  validates :name, :address, :phone, presence: true
  validates :phone, numericality: true, length: { minimum: 9}
  
  
  def add_line_items(cart)
    cart.line_items.each do |line_item|
      line_item.cart_id = nil
      line_items << line_item
    end
  end
end
