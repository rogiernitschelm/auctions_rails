class Admin::JobSeekersController < UsersController
  # load_and_authorize_resource

  def index
    render json: @job_seekers
  end

  def show
    render json: @job_seeker
  end

  def create
    @job_seeker = JobSeeker.new(job_seeker_params)
    @job_seeker.user = create_user

    JobSeeker.transaction { @job_seeker.save! }

    render json: @job_seeker
  end

  def update
    render json: @job_seeker
  end

  def destroy
    render json: :ok
  end

  private

end
