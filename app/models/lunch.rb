class Lunch < ActiveRecord::Base
  has_many :votes
  has_many :lunch_options
  belongs_to :winning_restaurant,:class_name => 'Restaurant'
  belongs_to :company

  NUM_OPTIONS = 5

  def closing_time
    self.created_at + 1.hours
  end

  def close
    self.update_attribute(:state, 'closed')
    self.winning_restaurant= calc_winning_restaurant
    self.save
    votes.each do |vote|
      UserMailer.closed(vote.user,self).deliver
    end
  end

  def invite
    company.users.each do |user|
      UserMailer.invite(user).deliver
    end
  end

  def calc_winning_restaurant
    max_score = lunch_options.max_by{|l| l.score}.score
    lunch_options.reject{|l| l.score < max_score}.shuffle.first.restaurant
  end

  def chosen_restaurant
    winning_restaurant
  end

  def chosen_restaurant_count
    votes.reject{|v| v.restaurant != winning_restaurant}.count
  end

  def not_voted_yet
    company.users.count - votes.count
  end

  def open?
    state == 'open'
  end

  def everyone_voted?
    voted_users = votes.map(&:user)
    voted_users.count == company.users.count
  end

  def solico_votes
    votes.reject{|v| v.lunch_option.present?}
  end

end
