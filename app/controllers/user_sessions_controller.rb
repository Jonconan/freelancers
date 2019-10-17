class UserSessionsController < ApplicationController

  def sign_in
    render json: "sign_in"
  end

  def new_session
    render json: "new_session"
  end

  def sign_out
    render json: "sign_out"
  end
end
