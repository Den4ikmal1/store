require 'rails_helper'

RSpec.describe LineItem, type: :model do

  it { should belong_to :order }
  it { should belong_to :product }
  it { should belong_to :cart }

  it { should validate_numericality_of(:quantity).is_greater_than(0) }

  describe 'default scope' do
    let!(:line_one) { LineItem.create(price: 12) }
    let!(:line_two) { LineItem.create(price: 15) }

    it 'orders by ascending price' do
      expect(LineItem.all).to eq [line_one, line_two]
    end
  end

  describe '#total_price' do
    let(:product) { Product.create(price: 12) }
    let!(:line) { LineItem.create(quantity: 2, product: product) }
 
    it 'products total_price * quantity' do
      expect(line.total_price).to eq 24
    end
  end

  

end
