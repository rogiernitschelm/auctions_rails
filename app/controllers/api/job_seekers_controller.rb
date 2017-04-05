class Api::JobSeekersController < UsersController
  before_action :assert_no_session, only: :create
  skip_before_action :verify_authenticity_token, only: :create

  load_and_authorize_resource

  def show
    render json: @job_seeker
  end

  def create
    @job_seeker = JobSeeker.new(job_seeker_params)
    @job_seeker.user = create_user

    JobSeeker.transaction { @job_seeker.save! }

    login(user_params[:email], user_params[:password])

    render json: @job_seeker
  end

  def update
    render json: @job_seeker
  end

  def destroy
    render json: :ok
  end

  private

  def job_seeker_params
    # params.require().permit()
  end

end
