class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to tasks_path(user_id: user)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def index
    @users = User.all
  end

  private
  def user_params
  params.require(:user).permit(:email, :name, :introduction, :profile_image, :position)
  end
end
