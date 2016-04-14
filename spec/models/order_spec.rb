require 'rails_helper'

RSpec.describe Order, type: :model do


  it { should have_many(:line_items).dependent(:destroy) }

  it { should validate_presence_of :address }
  it { should validate_presence_of :name }
  it { should validate_presence_of :phone }
  it { should validate_length_of(:phone) }

  describe '#add_line_items' do
    let(:order) { create(:order) }
    let(:cart) { create(:cart) }  
    it 'add to order line_items with cart' do
      cart.line_items.create
      expect { order.add_line_items(cart) }.to change(order.line_items, :count).by(1)
    end
  end

  
end
