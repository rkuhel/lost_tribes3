class Ability
  include CanCan::Ability

  def initialize(user)
    @user ||= User.new # guest user (not logged in)
    @user.roles.each { |role| send(role) }

    if @user.roles.size == 0
      can :read, :all
    end
  end

  can :manage, :all if @user.role == "admin"

end
