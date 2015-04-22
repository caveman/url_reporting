ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'


#load seed data instead of fixtures
seed_urls = ['http://apple.com', 'https://apple.com', 'https://www.apple.com', 'http://developer.apple.com','http://en.wikipedia.org', 'http://opensource.org']
seed_referrers = ['http://apple.com', 'https://apple.com', 'https://www.apple.com','http://developer.apple.com', nil ]
1000000.times do |i|
  #Digest::MD5.hexdigest({id:1, url: 'http://apple.com', referrer: 'http://store.apple.com/us', created_at: Time.parse('2012-01-01')}.to_s)` 
  view = View.insert({ 
  	url: seed_urls[rand(seed_urls.size-1)], 
  	referrer: seed_referrers[rand(seed_urls.size-1)],
  	created_at: Time.now-rand(9).day
  })
end

# class ActiveSupport::TestCase
#   # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
#   #
#   # Note: You'll currently still have to declare fixtures explicitly in integration tests
#   # -- they do not yet inherit this setting
#   fixtures :all

#   # Add more helper methods to be used by all tests here...
# end
