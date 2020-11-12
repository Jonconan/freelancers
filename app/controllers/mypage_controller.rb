class MypageController < ApplicationController
  before_action :current_user_check
  before_action :set_page_head_title

  def index
    @user = User.find(current_user.id)
    @prefecture = Prefecture.find(@user.prefecture_id)
  end

  def edit
  end

  private

  def set_page_head_title
    action = params[:action]
    titles = {
      'index' => "#{current_user.user_name}さん専用マイページ",
      'new' => '新規ユーザー登録',
      'show' => 'ジョンさんのプロフィール詳細',
      'create' => 'アカウント作成完了',
      'confirm' => '新規登録確認'
    }
    @page_title = titles[action]
  end

end
