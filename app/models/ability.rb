class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :manage, Problem, :user_id => user.id
      can :manage, Comment, :problem => {:user_id => user.id}
    end
  end
end