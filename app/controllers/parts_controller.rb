class PartsController < ApplicationController
  before_action :authenticate_user

  def index
    @parts = @current_user.parts
    @include_menu_names = params[:include_menus] == 'true'
  end
end
