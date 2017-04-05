class Admin::EmployersController < UsersController
  load_and_authorize_resource

  def index
    render json: @employers
  end

  def show
    render json: @employer
  end

  def create
    @employer = Employer.new(employer_params)
    @employer.user = create_user

    Employer.transaction { @employer.save! }

    render json: @employer
  end

  def update
    render json: @employer
  end

  def destroy
    render json: :ok
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
