class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
    @user.profiles.build
  end

  def create
    @user = User.new(user_params)
    @user.save
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :password, profile_attributes: [:first_name, :family_name, :first_name_kana, :family_name_kana, :birth_date])
  end
end
