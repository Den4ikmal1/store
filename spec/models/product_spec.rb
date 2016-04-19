require 'rails_helper'

RSpec.describe Product, type: :model do

  it { should belong_to :category }
  it { should have_many :photos }
  it { should have_many :reviews }

  it { should validate_presence_of :title }
  it { should validate_presence_of :category_id }
  it { should accept_nested_attributes_for :photos }
  
 
end