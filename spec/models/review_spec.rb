require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should belong_to :user }
  it { should belong_to :product }

  it { should validate_presence_of :rating }
  it { should validate_presence_of :comment }
  it { should validate_uniqueness_of(:product_id).scoped_to(:user_id).with_message("You already voted") }

  describe '.average_review' do
    let(:category) { create(:category)}
    let(:product)  { create(:product, category: category)}
    let(:build)    { product.reviews }

    context 'if in review rating blank' do
      let!(:review1)  { create(:review_rating_blank, product: product)}
      it 'should to be rating = 0 in review' do
        expect(Review.average_review(product)).to eq(review1.rating)
      end
    end

    context 'if in review rating exist' do
      let!(:review)  { create(:review, product: product)}
      it 'should to be average rating in review' do
        expect(Review.average_review(product)).to eq(review.rating)
      end
    end

  end
end

