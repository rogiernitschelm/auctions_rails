class Api::BuyersController < UsersController
  before_action :assert_no_session, only: :create
  load_and_authorize_resource

  def show
    render json: @buyer
  end

  def create
    @buyer = Buyer.new(buyer_params)
    @buyer.user = create_user

    Buyer.transaction { @buyer.save! }

    login(user_params[:email], user_params[:password])

    render json: @buyer
  end

  def update
    render json: @buyer
  end

  def destroy
    render json: :ok
  end

  private

end
