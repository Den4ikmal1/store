class Ability
  include CanCan::Ability


  def initialize(user)
    @user = user
    
    if user 
      user.admin? ? admin_attributes : user_attributes(user)
    else
     guest_attributes
    end
  end

  def admin_attributes
    can :manage, :all
  end

  def user_attributes(user)
    can :read, :all
    can :create,  [Review]
    can :updade,  [Review], user_id: user.id
    can :destroy, [Review], user_id: user.id
    guest_attributes
  end

  def guest_attributes
    can :read, :all
  end
end
