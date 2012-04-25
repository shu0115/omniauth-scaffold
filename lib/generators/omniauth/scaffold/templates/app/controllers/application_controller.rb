# coding: utf-8
class ApplicationController < ActionController::Base

  protect_from_forgery

  # セッション有効期限延長
  before_filter :reset_session_expires

  private

  #-----------------------#
  # reset_session_expires #
  #-----------------------#
  # セッション期限延長
  def reset_session_expires
    request.session_options[:expire_after] = 2.weeks
  end

  #--------------#
  # current_user #
  #--------------#
  def current_user
    @current_user ||= User.where( id: session[:user_id] ).first
  end

  helper_method :current_user

end
