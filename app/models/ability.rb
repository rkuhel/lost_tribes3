class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.role == 'admin'
      can :manage, :all
    elsif user.role == 'vendor'
      can :read, [Beer, Event]
      can :create, Event
      can :update, Event do |event|
        event && event.creator == user
      end
      can :show, Cart do |cart|
        cart && cart.user_id == user.id
      end
      can :update, User do |person|
        person && person.id == user.id
      end
      can :show, User do |person|
        person && person.id == user.id
      end
      can :destroy, User do |person|
        person && person.id == user.id
      end
    elsif user.role == 'customer'
      can :read, [Beer, Event]
      can :update, User do |person|
        person && person.id == user.id
      end
      can :show, User do |person|
        person && person.id == user.id
      end
      can :show, Cart do |cart|
        cart && cart.user_id == user.id
      end
      can :destroy, User do |person|
        person && person.id == user.id
      end
    else
      can :read, [Beer, Event]
    end
  end
end


  # def initialize(user)
  #   # @user ||= User.new # guest user (not logged in)
  #   # @user.role.each { |role| send(role) }

  #   can :update, User

  #   @user = user || User.new(role: 'guest')

  #   alias_action :create, :read, :update, :destroy, :to => :crud

  #   # if @user.role == nil
  #   # can :read, :all
  #   # end

  #   if @user.role == 'admin'
  #     can :manage, :all
  #     # can :create, Event
  #   end

  #   if @user.role == 'vendor'
  #     can :crud, User, :user_id => @user.id
  #     can [:read, :create], Event
  #     can :crud, Event, @user.events.include?(@event)
  #     # can :manage, Cart, in @user.carts?
  #   end

  #   if @user.role == 'customer'
  #     can :crud, User, :user_id => @user.id
  #     can :read, Event
  #     # can :manage, Cart, in @user.carts?
  #     # can :manage, :all
  #   end

  #   if @user.role == 'guest'
  #   end
  # end
