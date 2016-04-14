class Category < ActiveRecord::Base
  
  has_many :products

  validates :name, presence: true

  before_destroy :ensure_not_referenced_by_any_product
  before_update :ensure_not_referenced_by_any_product

  def ensure_not_referenced_by_any_product
    if products.empty?
      return true
    else
      errors.add(:message, 'This Category has got products')
      return false
    end
  end
end
