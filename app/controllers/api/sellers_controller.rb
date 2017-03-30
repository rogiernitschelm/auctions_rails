class Api::SellersController < UsersController
  before_action :assert_no_session, only: :create
  load_and_authorize_resource

  def show
    render json: @seller
  end

  def create
    @seller = Seller.new(seller_params)
    @seller.user = create_user

    Seller.transaction { @seller.save! }

    login(user_params[:email], user_params[:password])

    render json: @seller
  end

  def update
    render json: @seller
  end

  def destroy
    current_user.destroy!

    render status: :ok
  end

  private

end
