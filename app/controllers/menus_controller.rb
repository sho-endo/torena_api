class MenusController < ApplicationController
  before_action :authenticate_user

  def create
    part = current_user.parts.find_by(id: params[:part_id])
    unless part
      render json: { message: 'Bad Request' }, status: 400 and return
    end

    menu = part.menus.build(menu_params)
    if menu.save
      render json: {
        message: "#{menu.name}を追加しました",
        menu: menu
      }, status: 200
    else
      render json: {
        message: menu.errors.full_messages
      }, status: 400
    end
  end

  private

    def menu_params
      params.require(:menu).permit(:name)
    end
end
