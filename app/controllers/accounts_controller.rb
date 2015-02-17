class AccountsController < ApplicationController

  before_filter :load_account, only: [:edit, :update, :destroy]

  def index
    @accounts = Account.all
  end

  def new
    @account = Account.new params[:account] ? account_params : {}
  end

  def create
    @account = Account.new account_params
    if @account.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def update
    if @account.update_attributes account_params
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end

  def destroy
    @account.destroy
    redirect_to :action => "index"
  end

  private

  def account_params
    params.require(:account).permit(:name)
  end

  def load_account
    @account = Account.find(params[:id])
  end

end