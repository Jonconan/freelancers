class ApplicationController < ActionController::Base
  STATUS_LIST = [
    "稼働中", "休職中", "案件募集中"
  ]

  DISPLAY_TYPE = [
    "全表示", "年月のみ表示", "年齢のみ表示", "表示しない"
  ]
end
