class Product < ActiveRecord::Base

  belongs_to :category
  has_many :photos, as: :photoable
  has_many :reviews
  has_many :line_items

  default_scope -> { order "created_at" }
  scope :expensive_price, -> { where("price > 300")}


  validates :title, :category_id, presence: true
  before_destroy :ensure_not_referenced_by_any_line_item

  accepts_nested_attributes_for :photos
 
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end

  

end
