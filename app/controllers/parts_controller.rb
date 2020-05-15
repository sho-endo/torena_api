class PartsController < ApplicationController
  before_action :authenticate_user

  def index
    @parts = @current_user.parts
    @include_menu_names = params[:include_menus] == 'true'
  end

  def create
    part = current_user.parts.build(part_params)
    if part.save
      render json: {
        message: "#{part.name}を作成しました",
        part: part
      }, satus: 200
    else
      render json: {
        message: part.errors.full_messages
      }, status: 400
    end
  end

  def destroy
    if (part = current_user.parts.find_by(id: params[:id]))
      part.destroy
      render json: {
        message: "「#{part.name}」を削除しました"
      }, status: 200
    else
      render json: { message: 'Bad Request' }, status: 400
    end
  end

  private
    def part_params
      params.require(:part).permit(:name)
    end
end
