class UsersController < ApplicationController
  include SessionHelpers
  before_action :assert_no_session, only: :create_user

  load_and_authorize_resource

  def create_user
    @user = User.new(user_params)
  end

  def update_user
  end

  protected

  def user_params
    raise('You are trying something you should not.') if params[:is_admin]

    {
      email: params[:email],
      password: params[:password],
      first_name: params[:first_name],
      last_name: params[:last_name],
      location: params[:location]
    }
  end
end
