class UsersController < ApplicationController
  before_action :set_page_head_title
  # before_action :current_user_check, only: [:show]
  before_action :initialize, only: [:new, :confirm]
  before_action :delete_basic_info_with_error_in_session, only: [:index, :show]

  require 'date'

  def index
    render 'index', layout: 'application'
  end

  def new
    @user = User.new
    @errors = session[:user_errors]
    render 'new', layout: 'application'
  end

  def show
    @user = User.find(params[:id])
    @prefecture = Prefecture.find(@user.prefecture_id)
    render 'show', layout: 'application'
  end

  def confirm
    @errors = session[:user_errors]
    if params[:post].present?
      session[:basic_info] = params[:post]
      user = User.new(user_params)
      user.valid?
      unless user.valid_of_specified?(:name, :user_code, :user_name, :email)
        session[:user_errors] = user.errors.messages
        redirect_to new_user_path and return
      end
    end
    render 'confirm', layout: 'application'
  end

  def create
    basic_info = session[:basic_info]
    post = params[:post]
    @user = User.new(
      user_params(password: post[:password], password_confirmation: post[:password_confirmation])
    )

    delete_error_in_session
    if @user.valid?
      @user.save
      delete_basic_info_with_error_in_session
      login(@user.user_code, post[:password])
      render 'create', layout: 'application'
    else
      session[:user_errors] = @user.errors.messages
      redirect_to '/users/confirm'
    end
  end

  def check
    render json: User.all
  end

  private

  def set_page_head_title
    action = params[:action]
    titles = {
      'index' => 'トップ',
      'new' => '新規ユーザー登録',
      'show' => 'ジョンさんのプロフィール詳細',
      'create' => 'アカウント作成完了',
      'confirm' => '新規登録確認'
    }
    @page_title = titles[action]
  end

  def user_params(password: nil, password_confirmation: nil)
    basic_info = session[:basic_info]
    user_params = {
      'name'          => user_full_name.strip,
      'user_code'     => basic_info['user_code'],
      'user_name'     => basic_info['user_name'],
      'email'         => basic_info['email'],
      'gender_id'     => basic_info['gender_id'],
      'birthday'      => user_birthday,
      'password'      => password,
      'password_confirmation' => password_confirmation,
      'prefecture_id' => basic_info['prefecture_id'],
      'area'          => basic_info['area'],
      'display_type'  => basic_info['display_type'],
      'twitter_id'    => basic_info['twitter_id'],
      'facebook_id'   => basic_info['facebook_id'],
      'github_id'     => basic_info['github_id'],
      'youtube_id'    => basic_info['youtube_id'],
      'website_url'   => basic_info['website_url']
    }
  end

  def initialize
    @status = STATUS_LIST.map { |column| [column[1], column[0]] }
    @display_type = DISPLAY_TYPE.map { |column| [column[1], column[0]] }
    @gender = GENDER_LISTS
    @prefectures = []
    Prefecture.all.each do |prefecture|
      @prefectures.push([prefecture.name, prefecture.id])
    end
    set_date_select_list
  end

  def user_full_name
    basic_info = session[:basic_info]
    basic_info['last_name'] + ' ' + basic_info['first_name']
  end

  def user_birthday
    basic_info = session[:basic_info]
    DateTime.new(
      basic_info['birthday_year'].to_i,
      basic_info['birthday_month'].to_i,
      basic_info['birthday_day'].to_i
    )
  end

  def delete_basic_info_in_session
    session.delete(:basic_info)
  end

  def delete_error_in_session
    session.delete(:user_errors)
  end

  def delete_basic_info_with_error_in_session
    session.delete(:basic_info)
    session.delete(:user_errors)
  end

end
