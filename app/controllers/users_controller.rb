class UsersController < ApplicationController
  
  load_and_authorize_resource

  before_filter :load_accounts, only: [:new, :edit]

  def create
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    
    if @user.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def update
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    
    if @user.update_attributes user_params
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end

  def destroy
    @user.destroy
    redirect_to :action => "index"
  end

  private

  def user_params
    params.require(:user).permit(:email, :firstname, :surname, :avatar, :role, :password, :password_confirmation)
  end

  def load_accounts
    @accounts = Account.all
  end

end