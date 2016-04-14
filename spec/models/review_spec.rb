require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should belong_to :user }
  it { should belong_to :product }

  it { should validate_presence_of :rating }
  it { should validate_presence_of :comment }
  it { should validate_uniqueness_of(:product_id).scoped_to(:user_id).with_message("You already voted") }
end

