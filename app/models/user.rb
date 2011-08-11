class User < ActiveRecord::Base
  has_many :votes
  belongs_to :company

  before_create :generate_token

  def voted_on?(lunch)
    voted_for(lunch).present?
  end

  def voted_for(lunch)
    votes.each do |v|
      return v if v.lunch == lunch
    end
    nil
  end

#  def admin?
#    self[:admin]
#  end

  def days_since_last_win
    days = 0
    votes.reverse[1..-1].each do |vote|
      if vote.losing_vote?
        days+= 1
      else
        return days
      end
    end
    days
  end

  def generate_token
    self.token=UUID.generate(:compact)
  end

end
