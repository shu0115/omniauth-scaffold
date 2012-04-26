# coding: utf-8

# ---------- 環境別定義 ---------- #
if Rails.env.production?
  #----------------#
  # Production環境 #
  #----------------#
  DEFAULT_PROVIDER = "twitter"
#  DEFAULT_PROVIDER = "facebook"
#  DEFAULT_PROVIDER = "github"
else
  #--------------------#
  # Production環境以外 #
  #--------------------#
#  DEFAULT_PROVIDER = "developer"
  DEFAULT_PROVIDER = "twitter"
#  DEFAULT_PROVIDER = "facebook"
#  DEFAULT_PROVIDER = "github"
end

# ---------- 共通定義 ---------- #
APP_NAME = "YOUR_APP_NAME"
