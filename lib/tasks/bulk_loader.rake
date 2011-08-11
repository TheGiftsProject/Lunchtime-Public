namespace :bulk do
  task :restaurants => :environment do
    File.readlines("rest.csv").each do |line|
      data = line.split(",")
      name = data.first
      tag = data.last
      puts "#{name} - #{tag}"
      r = Restaurant.find_or_create_by_name(name)
      t = Tag.find_or_create_by_name(tag)
      r.tags << t
      r.touch
      r.save
      t.save
    end
  end
end