class Town::SessionsController < ApplicationController

  skip_before_filter :authenticate_user!,:except => :destroy
  layout "dashboard"
  before_filter :logged_in_redirect, :only=>[:new,:create]
  skip_before_action :verify_authenticity_token

  def new
    @user = User.new
    flash[:errors] = []
  end

  def create
    @user = User.where(:email => user_params[:email]).first
    if @user.present? && @user.valid_password?(user_params[:password])
      sign_in @user
      return redirect_to town_home_index_path
    else
      flash[:error] = "Email or Password do not match."
    end
    redirect_to :new_user_session
  end

  def destroy
    if user_signed_in?
      reset_session
      flash[:info] = "You have been successfully signed out"
    end
    redirect_to :new_user_session
  end
  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
