class Ability
  include CanCan::Ability

  def initialize(user)
    # NOTE - the order of these rules is very important!
    user ||= User.new # guest user (not logged in)

    can :read, User
    can :read, Wiki, public: true
    can :read, Page, wiki: { public: true }

    unless user.new_record?
      can :manage, Wiki, public: true
      can :manage, Wiki, owner_id: user.id
      cannot :manage, Wiki, public: false unless user.premium?

      can :manage, Page, wiki: { public: true }
      can :manage, Page, wiki: { owner_id: user.id }
      cannot :manage, Page, wiki: { public: false } unless user.premium?

      can :manage, User, id: user.id
    end

    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
