class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can :read, User
    can :read, Wiki, public: true
    can :read, Page, wiki: { public: true }

    unless user.new_record?
      can :manage, Wiki, public: true
      can :manage, Wiki, user_id: user.id
      can :manage, Page, wiki: { public: true }
      can :manage, Page, wiki: { user_id: user.id }
      can :manage, User, id: user.id
    end

    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
