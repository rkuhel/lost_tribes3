class Ability
  include CanCan::Ability

  def initialize(user)
    # @user ||= User.new # guest user (not logged in)
    # @user.role.each { |role| send(role) }

    @user = user || User.new(role: 'guest')

    alias_action :create, :read, :update, :destroy, :to => :crud

    # if @user.role == nil
      # can :read, :all
    # end

    if @user.role == 'admin'
      can :manage, :all
      # can :create, Event
    end

    if @user.role == 'vendor'
      can :crud, User, :user_id => @user.id
      can [:read, :create], Event
      can :crud, Event, @event.creator_id => @user.id
      # can :manage, Cart, in @user.carts?
    end

    if @user.role == 'customer'
      can :crud, User, :user_id => @user.id
      can :read, Event
      # can :manage, Cart, in @user.carts?
      # can :manage, :all
    end

    if @user.role == 'guest'
    end
  end
end
