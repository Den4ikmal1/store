class Ability
  include CanCan::Ability

  attr_reader :user

  def initialize(user)
    @user = user
    
    if user 
      user.admin? ? admin_attributes : user_attributes
    else
     guest_attributes
    end
  end

  def admin_attributes
    can :manage, :all
  end

  def user_attributes
    can :read, :all
    can :create,  [Review]
    can :updade,  [Review], user: user
    can :destroy, [Review], user: user
    guest_attributes
  end

  def guest_attributes
    can :read, :all
  end
end
