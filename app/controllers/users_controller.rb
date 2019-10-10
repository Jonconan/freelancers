class UsersController < ApplicationController
  before_action :set_page_head_title
  before_action :set_date_select_list, only: [:new]

  def index
  end

  def new
    @status = STATUS_LIST
    @display_type = DISPLAY_TYPE
  end

  def show
    @id = params[:id]
  end

  private

  def set_page_head_title
    action = params[:action]
    titles = {
      "index" => "トップ",
      "new" => "新規ユーザー登録",
      "show" => "ジョンさんのプロフィール詳細"
    }
    @page_title = titles[action]
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
