class Api::V1::AuthenticationsController < ApplicationController
  skip_before_filter :verify_authenticity_token


  def create
    @user = User.find_by_username(params[:username])

    if @user.present? && @user.valid_password?(params[:password])
      @user.ensure_authentication_token!

      return render status: 200
    end

    render status: 401
  end
end
