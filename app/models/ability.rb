class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    end

    if user.visitor? || user.vip?
      can :read, :all
    end
  end
end
