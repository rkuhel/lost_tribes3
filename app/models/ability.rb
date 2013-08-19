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
        event && event.creator_id == user.id
      end
      can :destroy, Event do |event|
        event && event.creator == user
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

      can :show, Cart do |cart|
        cart && cart.user_id == user.id
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
