class StaticController < ApplicationController

  skip_before_filter :get_user,:get_company


  def no_user
    render :file=>"static/error_page"
  end

  def no_admin
    render :file=>"static/error_page"
  end

  def no_site
    render :file=>"static/error_page"
  end

  def welcome
    if (session[:user] && user = User.find_by_token(session[:user]))
      redirect_to action_path(user.company.url,:token=>user.token)
    end

  end
end