class UserSessionsController < ApplicationController

  def sign_in
  end

  def create
    post_params = params[:post]
    @user = login(post_params[:user_code], post_params[:password])
    if @user
      redirect_to root_path
    else
      render json: "NG"
    end
  end

  def sign_out
    logout
    redirect_to root_path
  end

  private

end
