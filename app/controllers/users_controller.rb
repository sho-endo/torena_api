class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      render json: {
        status: :created,
        logged_in: true,
        user: user
      }, status: 200
    else
      head 500
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
