class UserSessionsController < ApplicationController
  include SessionHelpers

  skip_before_action :verify_authenticity_token, only: [:create, :destroy]

  def create
    login(user_params[:email], user_params[:password])
  end

  def destroy
    logout(current_user)
  end
end
