class SessionsController < ApplicationController
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
      render json: {
        message: 'ログインに失敗しました'
      }, status: 401
    end
  end

  def destroy
    reset_session
    render json: {
      message: 'ログアウトしました',
      logged_in: false
    }, status: 200
  end

  def logged_in
    if logged_in?
      render json: {
        logged_in: true,
        user: current_user
      }
    else
      render json: {
        logged_in: false
      }
    end
  end
end
