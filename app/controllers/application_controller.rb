class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

  before_action :authenticate_user!

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def url_options
    {locale: I18n.locale}.merge(super)
  end

  def current_account
    current_user.account
  end

  helper_method :current_account

end