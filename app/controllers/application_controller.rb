class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_user,:get_company

  def get_user
    if (params[:token])
      @user = User.find_by_token(params[:token])
    elsif (session[:user])
      @user = User.find_by_token(session[:user])
    end

    redirect_to no_user_path and return nil if @user.nil?

    session[:user] = @user.token
    return @user
  end

  def get_company
    @company = Company.find_by_url(params[:company_url])
    if @company.nil?
      redirect_to no_site_path
    end
  end

  def require_admin
    unless @user.admin?
      redirect_to no_admin_path and false
    end
    true
  end
end
