# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

seed_urls = ['http://apple.com', 'https://apple.com', 'https://www.apple.com', 'http://developer.apple.com','http://en.wikipedia.org', 'http://opensource.org']
seed_referrers = ['http://apple.com', 'https://apple.com', 'https://www.apple.com','http://developer.apple.com', nil ]
1000000.times do |i|
  puts "Creating seed link #{i}"

  view = View.insert({ 
  	url: seed_urls[rand(seed_urls.size-1)], 
  	referrer: seed_referrers[rand(seed_urls.size-1)],
  	created_at: Time.now-rand(9).day
  })
  #Digest::MD5.hexdigest(view.to_s)
end

#generate hexdigest hash 
# View.all.each do |view|
# 	view.hash = Digest::MD5.hexdigest({id:view.id, url: view.url, referrer: view.referrer, created_at: view.created_at}.to_s) 
# 	view.save
# end
  