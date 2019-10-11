class UsersController < ApplicationController
  before_action :set_page_head_title
  before_action :initialize, only: [:new, :confirm]

  def index
    render "index", layout: "application"
  end

  def new
    @user = User.new
    render "new", layout: "application"
  end

  def show
    render "show", layout: "application"
  end

  def confirm
    if params[:post].present?
      delete_basic_info_in_session
      session[:basic_info] = params[:post]
    end
    render "confirm", layout: "application"
  end

  def create
    render json: params
  end

  private

  def set_page_head_title
    action = params[:action]
    titles = {
      "index" => "トップ",
      "new" => "新規ユーザー登録",
      "show" => "ジョンさんのプロフィール詳細",
      "confirm" => "新規登録確認"
    }
    @page_title = titles[action]
  end

  def initialize
    @status = STATUS_LIST.map { |column| [column[1], column[0]] }
    @display_type = DISPLAY_TYPE.map { |column| [column[1], column[0]] }
    @prefectures = []
    Prefecture.all.each do |prefecture|
      @prefectures.push([prefecture.name, prefecture.id])
    end
    set_date_select_list
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

  def delete_basic_info_in_session
    session.delete(:basic_info)
  end
end
