class UserSessionsController < ApplicationController

  def sign_in
  end

  def new_session
    post_data = params[:post]

    @user = login(params[:user_code], params[:password]) if user_check?
    if @user
      flash[:alert] = "ログインしました"
      redirect_to root_path
    else
      render json: "NG"
    end
  end

  def sign_out
  end

  private

  def user_check?
    user = User.find_by(user_code: post_data["user_code"])
    user.present?
  end
end
