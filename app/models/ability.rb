class Ability
  include CanCan::Ability

  def initialize(user)
    @user ||= User.new # guest user (not logged in)
    @user.roles.each { |role| send(role) }

    alias_action :create, :read, :update, :destroy, :to => :crud

    if @user.roles.size == 0
      can :read, :all
    end
    if @user.roles == "vendor"
      can :read, :all
      can :create, Event 
      can :update, Event, :active => true, :creator_id => user.id
      can :destroy, Event, :active => true, :creator_id => user.id
    end
  end

  can :manage, :all if user.role == "admin"

end
