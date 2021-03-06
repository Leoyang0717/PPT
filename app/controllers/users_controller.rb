class UsersController < ApplicationController
  def sign_up
    @user = User.new
  end

  def sign_in
    @user = User.new
  end
  def login
    # if user_params[:account] && user_params[:password] login已經先幫我們確認一波了
      user = User.login(user_params)
      if user
        sign_in_user(user)
        redirect_to root_path, notice:'登入成功'
      else
        redirect_to sign_in_users_path, notice:'請輸入正確帳號密碼'
      end
    # else
    #   redirect_to sign_in_users_path, notice:'請輸入正確帳號密碼'
    # end
  end
  def create
    @user = User.new(user_params)
    if @user.save
      # session[:user_token] = @user.id
      sign_in_user(@user)
      redirect_to root_path, notice:'會員註冊成功'
    else
      render :sign_up
    end
  end
  def sign_out
    sign_out_user
    redirect_to root_path, notice:'登出成功'
  end

  
  private
  def sign_in_user(u)
    session[:user_token] = u.id
  end

  def sign_out_user
    session[:user_token] = nil
  end

  def user_params
    params.require(:user).permit(:account,:password,:email)
  end
end
