class ApplicationController < ActionController::API
  include ActionController::Cookies
  include ActionController::RequestForgeryProtection

  private

    def current_user
      if (user_id = session[:user_id])
        @current_user ||= User.find_by(id: user_id)
      end
    end

    def logged_in?
      !current_user.nil?
    end

    def authenticate_user
      unless logged_in?
        render json: {
          message: 'ログインが必要です'
        }, status: :unauthorized
      end
    end
end
