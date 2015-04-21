# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# def random_date(from, to)
# 	Time.at((to.to_f - from.to_f)*rand + from.to_f)
# end

seed_urls = ['http://apple.com', 'https://apple.com', 'https://www.apple.com', 'http://developer.apple.com','http://en.wikipedia.org', 'http://opensource.org']
seed_referrers = ['http://apple.com', 'https://apple.com', 'https://www.apple.com','http://developer.apple.com', nil ]

#random 10 distinct and sequential days
#parallel threading??
100000.times do |i|
  puts "Creating seed link #{i}"
  #Digest::MD5.hexdigest({id:1, url: 'http://apple.com', referrer: 'http://store.apple.com/us', created_at: Time.parse('2012-01-01')}.to_s)` 
  view = View.insert({ 
  	url: seed_urls[rand(seed_urls.size-1)], 
  	referrer: seed_referrers[rand(seed_urls.size-1)],
  	created_at: Time.now-rand(9).day
  })
  #Digest::MD5.hexdigest(view.to_s)
  # Product.create(name: "Product ##{i}", description: "A product.")
end
