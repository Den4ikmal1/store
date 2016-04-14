require 'rails_helper'

RSpec.describe Ability, type: :model do
 subject(:ability) { Ability.new(user) }

  describe "for guest" do
    let(:user) { nil }

    it { should be_able_to :read, :all }
    it { should_not be_able_to :manage, :all }
  end

  describe 'for Admin' do
    let(:user) { create :user, admin: true }

    it { should be_able_to :manage, :all }
  end

  describe 'for user' do
    let!(:user) { create :user }
    let(:other) { create :user }
    

    it { should_not be_able_to :mange, :all }
    it { should be_able_to :read, :all }

    it { should be_able_to :create, Review }
    # it { should be_able_to :update, create(:review, user: user), user_id: user.id }
    it { should_not be_able_to :update, create(:review, user: other), user_id: user.id }
  
  end
 
end
