require 'rails_helper'

RSpec.describe Product, type: :model do

  it { should belong_to :category }
  it { should have_many :photos }
  it { should have_many :reviews }

  it { should validate_presence_of :title }
  it { should validate_presence_of :category_id }
  it { should accept_nested_attributes_for :photos }
  
  describe '#average_review' do
    let(:category) { create(:category)}
    let(:product)  { create(:product, category: category)}
    let(:build)    { product.reviews }

    context 'if in review rating blank' do
      let!(:review1)  { create(:review_rating_blank, product: product)}
      it 'should to be rating = 0 in review' do
        expect(product.average_review(build)).to eq 0
      end
    end

    context 'if in review rating exist' do
      let!(:review)  { create(:review, product: product)}
      it 'should to be average rating in review' do
        expect(product.average_review(build)).to eq(review.rating)
      end
    end

  end
end