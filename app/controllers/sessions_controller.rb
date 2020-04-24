class SessionsController < ApplicationController
  include CurrentUserConcern

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      render json: {
        status: :created,
        logged_in: true,
        user: user
      }, status: 200
    else
      head 401
    end
  end

  def destroy
    reset_session
    render json: { logged_in: false }, status: 200
  end

  def logged_in
    if @current_user
      render json: {
        logged_in: true,
        user: @current_user
      }
    else
      render json: {
        logged_in: false
      }
    end
  end
end
