class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    return unless user.persisted?

    can :manage, Note, user_id: user.id
    can :manage, UserProfile, user_id: user.id
  end
end
