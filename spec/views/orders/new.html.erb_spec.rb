require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      :name => "MyString",
      :address => "MyText",
      :phone => 1
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input#order_name[name=?]", "order[name]"

      assert_select "textarea#order_address[name=?]", "order[address]"

      assert_select "input#order_phone[name=?]", "order[phone]"
    end
  end
end
