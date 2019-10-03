class UsersController < ApplicationController

  def index
    @page_title = "トップ"
  end

  def show
    @page_title = "ジョンさんのプロフィール詳細"
    @id = params[:id]
  end
end
