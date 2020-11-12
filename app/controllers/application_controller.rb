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

  def set_date_select_list
    select_year
    select_month
    select_day
  end

  def select_year
    year = Time.zone.now
    year = year.strftime('%Y').to_i

    @years = []
    ((year - 100)..year).each do |y|
      @years.push(y)
    end
    @years.reverse!
  end

  def select_month
    @months = (1..12)
  end

  def select_day
    @days = (1..31)
  end


end
