class UserMailer < ActionMailer::Base
  default :from => "lunchtime@giftsproject.com"

  def invite(user)
    @user = user
    mail(:to=>@user.email,
         :subject=>"Lunch Time vote is open")
  end

  def closed(user,lunch)
    @user = user
    @lunch = lunch
    mail(:to=>@user.email,:subject=>"Lunch Time vote just closed")
  end

end
