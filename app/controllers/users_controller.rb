class UsersController < ApplicationController
  before_action :set_page_head_title
  before_action :initialize, only: [:new, :confirm]

  require "date"

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
    basic_info = session[:basic_info]
    post = params[:post]
    @user = User.create(
      name: user_full_name,
      user_code: basic_info["user_code"],
      user_name: basic_info["user_name"],
      email: basic_info["email"],
      prefecture_id: basic_info["prefecture_id"],
      area: basic_info["area"],
      birthday: user_birthday,
      display_type: basic_info["display_type"],
      status_id: basic_info["status_id"],
      twitter_id: basic_info["twitter_id"],
      facebook_id: basic_info["facebook_id"],
      github_id: basic_info["github_id"],
      youtube_id: basic_info["youtube_id"],
      website_url: basic_info["website_url"],
      password: post[:password],
      password_confirmation: post[:password_confirmation]
    )
    if @user.save!
      redirect_to '/'
    else
      render json: @user
    end
  end

  def check
    render json: User.all
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

  def user_full_name
    basic_info = session[:basic_info]
    basic_info["last_name"] + ' ' + basic_info["first_name"]
  end

  def user_birthday
    basic_info = session[:basic_info]
    DateTime.new(
      basic_info["birthday_year"].to_i,
      basic_info["birthday_month"].to_i,
      basic_info["birthday_day"].to_i
    )
  end
end
