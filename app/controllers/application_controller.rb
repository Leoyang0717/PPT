class ApplicationController < ActionController::Base
  include Pundit
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from Pundit::NotAuthorizedError,with: :not_authorize
  # before_action :user_signed_in?,:current_user
  helper_method :user_signed_in?,:current_user
  
  private
  def not_found
    render file: '/public/404.html', status: 404,layout: false
  end
  def not_authorize
    redirect_to root_path, notice:'權限不足或請付款!'
  end
  def user_signed_in?
    current_user != nil
  end
  def current_user
    @current_user ||= User.find_by(id: session[:user_token])
  end
  def authenticate_user!
    redirect_to root_path,notice: "請登入會員" if not user_signed_in?
  end
end
