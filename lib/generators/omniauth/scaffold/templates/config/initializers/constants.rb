# coding: utf-8

# ---------- 環境別定義 ---------- #
if Rails.env.production?
  #----------------#
  # Production環境 #
  #----------------#
  DEFAULT_PROVIDER = "twitter"
else
  #--------------------#
  # Production環境以外 #
  #--------------------#
  DEFAULT_PROVIDER = "developer"
#  DEFAULT_PROVIDER = "twitter"
end
