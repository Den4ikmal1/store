class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  default_scope -> { order "created_at desc" }

  validates :rating, :comment, presence: true
  validates :product_id, uniqueness: {scope: :user_id,  message: "You already voted"}

  
end
