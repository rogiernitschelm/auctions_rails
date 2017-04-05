class Api::EmployersController < UsersController
  before_action :assert_no_session, only: :create
  skip_before_action :verify_authenticity_token, only: :create

  load_and_authorize_resource

  def show
    render json: @employer
  end

  def create
    @employer = Employer.new(employer_params)
    @employer.user = create_user

    Employer.transaction { @employer.save! }

    login(user_params[:email], user_params[:password])

    render json: @employer
  end

  def update
    render json: @employer
  end

  def destroy
    current_user.destroy!

    render status: :ok
  end

  private

  def employer_params
    params.require(:employer).permit(
      :chamber_of_commerce,
      :company_name,
      :company_location,
      :company_business,
      :recruitment_agency
    )
  end

end
