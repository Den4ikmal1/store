class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  default_scope -> { order "created_at desc" }

  validates :rating, :comment, presence: true
  validates :product_id, uniqueness: {scope: :user_id,  message: "You already voted"}

   def self.average_review(product)
    average_review = 0 if product.reviews.blank?
    average_review ||= product.reviews.average(:rating).round(2)
  end
end
