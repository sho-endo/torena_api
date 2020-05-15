class MenusController < ApplicationController
  before_action :authenticate_user
  before_action :validate_part_id

  def create
    part = current_user.parts.find(params[:part_id])
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

  def destroy
    part = current_user.parts.find(params[:part_id])
    if (menu = part.menus.find_by(id: params[:id]))
      menu.destroy
      render json: {
        message: "「#{menu.name}」を削除しました"
      }, status: 200
    else
      render json: { message: 'Bad Request' }, status: 400
    end
  end

  private

    def menu_params
      params.require(:menu).permit(:name)
    end

    def validate_part_id
      unless current_user.parts.find_by(id: params[:part_id])
        render json: { message: 'Bad Request' }, status: 400 and return
      end
    end
end
