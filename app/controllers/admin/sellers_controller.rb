class Admin::SellersController < UsersController
  load_and_authorize_resource

  def index
    render json: @sellers
  end

  def show
    render json: @seller
  end

  def create
    @seller = Seller.new(seller_params)
    @seller.user = create_user

    Seller.transaction { @seller.save! }

    render json: @seller
  end

  def update
    render json: @seller
  end

  def destroy
    render json: :ok
  end

  private

end
