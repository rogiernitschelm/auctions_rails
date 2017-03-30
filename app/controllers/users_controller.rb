class UsersController < ApplicationController
  include SessionHelpers
  load_and_authorize_resource

  def create_user
    render json: @user
  end

  def update
    render json: @user
  end

  protected

  def permitted_params
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
