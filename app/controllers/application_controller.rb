class ApplicationController < ActionController::Base
  GENDER_LISTS = [
    '選択なし','男性','女性'
  ]

  STATUS_LIST = {
    0 => '稼働中',
    1 => '休職中',
    2 => '案件募集中'
  }

  DISPLAY_TYPE = {
    0 => '全表示',
    1 => '年月のみ表示',
    2 => '年齢のみ表示',
    3 => '表示しない'
  }

  def current_user_check
    redirect_to sign_in_path unless logged_in?
  end

end
