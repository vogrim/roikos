class UsersController < ApplicationController

  before_filter :load_user, only: [:edit, :update, :destroy]
  before_filter :load_accounts, only: [:new, :edit]

  def index
    @users = current_account.users.all
  end

  def new
    @users = current_account.users.new params[:account] ? user_params : {}
  end

  def create
    @user = current_account.users.new account_params
    if @user.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def update
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
    params.require(:user).permit(:email, :encrypted_password, :firstname, :surname)
  end

  def load_user
    @user = current_account.users.find(params[:id])
  end

  def load_accounts
    @accounts = Account.all
  end

end