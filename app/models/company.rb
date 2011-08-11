class Company < ActiveRecord::Base
  has_many :users
  has_many :lunches
  has_and_belongs_to_many :restaurants

  def open_lunch
    lunch = Lunch.create do |lunch|
      lunch.company = self
      lunch.date = Date.today
      lunch.state = 'open'

      get_random_restaurants(Lunch::NUM_OPTIONS).each do |restaurant|
        lunch.lunch_options.build({:restaurant => restaurant})
      end
    end

    lunch.invite
    return lunch
  end

  def find_this_weeks_winning_restaurants
    lunches.where(:created_at=>(Time.now.beginning_of_week-1.day..Time.now.beginning_of_week+3.days)).map(&:winning_restaurant)
  end

  def get_random_restaurants(num)
    winning_rests = find_this_weeks_winning_restaurants

    top_rests = []
    bottom_rests = []
    Restaurant.all.shuffle.each do |rest|
      (winning_rests.include?(rest) ? bottom_rests : top_rests) << rest
    end
    restaurants = top_rests + bottom_rests
    restaurants[0..num-1]
  end

end
