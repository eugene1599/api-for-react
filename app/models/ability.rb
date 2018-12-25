class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    return unless user.persisted?

    can :manage, Race, user_id: user.id
    can :manage, Report, race: { user_id: user.id }
  end
end
