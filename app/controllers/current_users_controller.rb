class CurrentUsersController < ApplicationController

  def show
    @user = current_user
  end
  
  def update
    
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    
    if current_user.update_attributes user_params
      sign_in current_user, bypass: true
      redirect_to current_user_path, flash: { success: t('update.success') }
    else
      flash[:error] = "Fehler!"
      render :edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:email, :firstname, :surname, :avatar, :password, :password_confirmation)
  end
  
end