class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def show
    @user = User.find(current_user.id)
    @items = current_user.items
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :last_name, :first_name, :last_name_kana, :first_name_kana, :user_birthday)
  end

end
