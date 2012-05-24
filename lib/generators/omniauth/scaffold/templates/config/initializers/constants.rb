# coding: utf-8

# OmniAuth Provider
# Production環境
if Rails.env.production?
  DEFAULT_PROVIDER = "twitter"
  # DEFAULT_PROVIDER = "facebook"
  # DEFAULT_PROVIDER = "github"

# Production環境以外
else
  # DEFAULT_PROVIDER = "developer"
  DEFAULT_PROVIDER = "twitter"
  # DEFAULT_PROVIDER = "facebook"
  # DEFAULT_PROVIDER = "github"
end

# アプリケーション名
APP_NAME = "YOUR_APP_NAME"
