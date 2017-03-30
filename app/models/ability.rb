class Ability
  include CanCan::Ability

  def initialize(user)
    return guest_abilities unless user

    @user = user

    admin_abilities if user.admin?
    seller_abilities if user.seller?
    buyer_abilities if user.buyer?

    user_abilities
  end

  private

  def admin_abilities
    can :manage, :all
  end

  def seller_abilities
    can [:update, :destroy, :show], Seller, id: @user.seller.id
    can [:index, :show], Buyer

    # can :index, Buyer
    # can :index, Auction, user_id: @user.id
    # can :create, Auction
    # can :update, Auction, user_id: @user.id
  end

  def buyer_abilities
    can [:update, :destroy, :show], Buyer, id: @user.buyer.id
    can [:index, :show], Seller
    # can :index, Auction
    # can :index, Seller
  end

  def guest_abilities
    can :create, Seller
    can :create, Buyer
    # can :index, Auction
    # can :create, Buyer
  end

  def user_abilities
    can :update, User, id: @user.id
  end
end
