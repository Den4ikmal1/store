class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :cart
  default_scope -> { order "price" }

  validates :quantity, numericality: { greater_than: 0 } 

  def total_price
    product.price * quantity    
  end
end
