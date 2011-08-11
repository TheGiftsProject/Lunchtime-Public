class Restaurant < ActiveRecord::Base
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :companies
  has_many :lunch_options


  attr_reader :tag_tokens
  def tag_tokens=(ids)
    self.tag_ids = ids.split(',')#.map{|tag_id| Tag.find(tag_id)}
  end

end
