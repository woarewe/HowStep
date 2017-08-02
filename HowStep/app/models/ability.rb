class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new # guest user (not logged in)
      can :read, :all
      if user.admin?
        can :manage, :all
      else
        can :create, Post
        can  :manage, User, id: user.id
      end
    end
end
