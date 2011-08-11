class LunchController < ApplicationController
  before_filter :get_lunch

  def show
    if (@lunch.nil?)
      render 'waiting'
    elsif (@lunch.open?)
      if (@user.nil?)
        redirect_to :status=>500 and return
      end
      unless (@user.voted_on?(@lunch))
        render "vote"
      else
        @vote = @user.voted_for(@lunch) 
        render "voted"
      end
    else
      render "closed"
    end
  end

  def vote
    if params[:not_eating]
      if @user.voted_on?(@lunch)
        @vote = @user.voted_for(@lunch)
        @vote.lunch_option = nil
        @vote.save
      else
        @user.votes.create(:lunch=>@lunch)
      end
      render "voted",:layout=>false and return
    end
    lo = @lunch.lunch_options.find(params[:lo_id])
    @vote = @user.votes.create({:lunch_option=>lo,:lunch=>@lunch})

    @lunch.close if @lunch.everyone_voted?

    render "voted",:layout=>false
  end

  def open_lunch
    return unless @user.admin?
    @lunch = @company.open_lunch
    render "vote",:layout=>false
  end

  def close_lunch
    return unless @user.admin?
    @lunch.close
    render "closed",:layout=>false
  end

  private

  def get_lunch
    @lunch = @company.lunches.last
    @lunch = nil if @lunch.nil? or !@lunch.created_at.today?
  end
end
