class MypageController < ApplicationController

  def index
    @user = current_user
    @prefecture = Prefecture.find(current_user.prefecture_id)
    # render json: current_user
  end
end
