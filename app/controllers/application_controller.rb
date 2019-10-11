class ApplicationController < ActionController::Base
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
end
