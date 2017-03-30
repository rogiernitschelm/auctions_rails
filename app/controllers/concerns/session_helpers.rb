module SessionHelpers
  def assert_no_session
    render json: raise('You are already logged in.') if current_user
  end
end
