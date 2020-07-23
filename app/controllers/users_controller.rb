class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.new
  end

  def new
    @user = User.new
    @user.profiles.build
    @user.sending_destinations.build
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: '登録が完了しました。ログインしてください。'
    else
      render :new, notice: '登録に失敗しました'
    end
  end

  def show
    @user = User.find(params[:id])
  end 


  private
  def user_params
    params.require(:user).permit(:nickname, :email, :password, :profiles_attributes => [:first_name, :family_name, :first_name_kana, :family_name_kana, :birth_date, :sending_destinations_attributes => [:destination_first_name, :destination_family_name, :destination_first_name_kana, :destination_family_name_kana, :post_code, :city, :house_number, :building_name, :phone_number]])
  end
end
