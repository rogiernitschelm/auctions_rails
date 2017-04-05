class Ability
  include CanCan::Ability

  def initialize(user)
    return guest_abilities unless user

    @user = user

    admin_abilities if user.admin?
    employer_abilities if user.employer?
    job_seeker_abilities if user.job_seeker?

    user_abilities
  end

  private

  def admin_abilities
    can :manage, :all
  end

  def employer_abilities
    can [:update, :destroy, :show], Employer, id: @user.employer.id
    can [:index, :show], JobSeeker
  end

  def job_seeker_abilities
    can [:update, :destroy, :show], JobSeeker, id: @user.job_seeker.id
    can [:index, :show], Employer
  end

  def guest_abilities
    can :create, Employer
    can :create, JobSeeker
  end

  def user_abilities
    can :update, User, id: @user.id
  end
end
