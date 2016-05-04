require 'rails_helper'

RSpec.describe User, type: :model do
   it { should have_many :reviews }

   describe ".found_country" do
    it "search by country and definition name" do
      country_name = User.found_country('31.22.48.0')
      expect(country_name).to eq 'Albania'
    end
   end
end
