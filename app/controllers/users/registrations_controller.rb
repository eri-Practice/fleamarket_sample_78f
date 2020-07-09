# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  # def new
    # @user = User.new
    # @profile = @user.build_profile
    # @sending_destination = @user.build_sending_destination
  # end
  # GET /resource/sign_up
  # def new
  #   super
  # end
  def index
    @users = User.all
    @user = User.new
  end

  def new
    @user = User.new
    @user.build_profile
    @user.build_sending_destination
  end

  def create
    @user = User.new(user_params)
    @user.save!
  end

  def after_sign_up_path_for(resource)
    items_path
  end

  def after_inactive_sign_up_path_for(resource)
    items_path
  end


  private
  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :profile_attributes => [:first_name, :family_name, :first_name_kana, :family_name_kana, :birth_date], :sending_destination_attributes => [:destination_first_name, :destination_family_name, :destination_first_name_kana, :destination_family_name_kana, :post_code, :city, :house_number, :building_name, :phone_number, :prefecture_code])
  end
  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end