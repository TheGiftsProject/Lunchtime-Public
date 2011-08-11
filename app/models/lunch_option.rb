class LunchOption < ActiveRecord::Base
  has_many :votes
  belongs_to :restaurant
  belongs_to :lunch

  def score
    return 0 if votes.empty?
    votes.map(&:score).inject(&:+)
  end

end
