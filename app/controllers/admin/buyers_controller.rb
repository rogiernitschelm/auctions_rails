class Admin::BuyersController < UsersController
  # load_and_authorize_resource

  def index
    render json: @buyers
  end

  def show
    render json: @buyer
  end

  def create
    @buyer = Buyer.new(buyer_params)
    @buyer.user = create_user

    Buyer.transaction { @buyer.save! }

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
