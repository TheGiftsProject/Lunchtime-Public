class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :lunch
  belongs_to :lunch_option
  has_one :restaurant,:through=>:lunch_option
  def solico?
     lunch_option.nil? && lunch.present?
  end

  def score
    1 + user.days_since_last_win*0.3
  end

  def losing_vote?
    lunch_option and lunch and (lunch.chosen_restaurant != lunch_option.restaurant)
  end

end
