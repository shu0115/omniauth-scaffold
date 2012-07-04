# coding: utf-8
class SessionsController < ApplicationController

  #----------#
  # callback #
  #----------#
  def callback
    auth = request.env["omniauth.auth"]
    user = User.where( provider: auth["provider"], uid: auth["uid"] ).first || User.create_with_omniauth( auth )
    session[:user_id] = user.id

    redirect_to :root, notice: "ログインしました。"
  end

  #---------#
  # destroy #
  #---------#
  def destroy
    session[:user_id] = nil

    redirect_to :root, notice: "ログアウトしました。"
  end

  #---------#
  # failure #
  #---------#
  def failure
    render text: "<span style='color: red;'>Auth Failure</span>"
  end

end
