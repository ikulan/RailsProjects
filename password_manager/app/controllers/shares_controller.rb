class SharesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_password
  before_action :require_owner_permissions

  def new
    @user_password = UserPassword.new
  end

  def destroy
    @password.user_passwords.where(user_id: params[:user_id]).destroy_all
    redirect_to @password
  end

  def create 
    @user_password = @password.user_passwords.new(user_password_params)
    if @user_password.save
      redirect_to @password
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_password_params
    params.require(:user_password).permit(:user_id)
  end

  def set_password
    @password = current_user.passwords.find(params[:password_id])
  end

  def require_owner_permissions
    redirect_to @password unless @password.is_owner?(current_user)
  end
end