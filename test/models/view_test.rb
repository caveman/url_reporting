require 'test_helper'

class ViewTest < ActiveSupport::TestCase
  test "top urls are within last 5 days" do
    tops_urls = View.top_urls_in_past_days(5)
    tops_urls.keys.each do |date|
    	assert( (date >= 5.days.ago.strftime('%Y-%m-%d')) && (date <= Time.now.strftime('%Y-%m-%d')) )
    end
  end

  test "top urls has correct number of visits" do
    past_days = 5
    tops_urls = View.top_urls_in_past_days(past_days)
    tops_urls.each{ |date, views|
    	views.each do |view|
    		number_of_visits = View.where("url =? AND created_at LIKE ?", view[:url], "#{date}%").count
    		assert number_of_visits == view[:visits]
    	end
    }
  end

  test "top urls are sorted by number of visits" do
    past_days = 5
    tops_urls = View.top_urls_in_past_days(past_days)
  	tops_urls.each{ |date, views|
  		visits = views.map{ |view| view[:visits] }
  		assert visits == visits.sort{ |a,b| b<=>a }
  	}
  end

  test "top referrers are within last 5 days" do
    tops_referrers = View.top_referrers_in_past_days(5)
    tops_referrers.keys.each do |date|
    	assert( (date >= 5.days.ago.strftime('%Y-%m-%d')) && (date <= Time.now.strftime('%Y-%m-%d')) )
    end
  end

  test "top referrers visits per url sum up to url visits " do
    top_referrers = View.top_referrers_in_past_days(5)
    top_referrers.each{ |date, views|
    	views.each do |view|
    		assert view[:visits] == view[:referrers].map{ |referrer| referrer[:visits] }.sum
    	end
    }
  end

  test "top referrers are sorted by number of visits" do
    top_referrers = View.top_referrers_in_past_days(5)
    top_referrers.each{ |date, views|
    	views.each do |view|
    		referrer_visits = view[:referrers].map{ |referrer| referrer[:visits] }
    		assert referrer_visits == referrer_visits.sort{ |a,b| b<=>a }
    	end
    }
  end

  test "top referrers has correct number of visits" do
    past_days = 5
    tops_urls = View.top_referrers_in_past_days(past_days)
    tops_urls.each{ |date, views|
    	views.each do |view|
    		view[:referrers].each do |referrer|
    			number_of_visits_for_referrer = View.where("url = ? AND referrer #{referrer[:url].nil? ? 'IS':'='} ? AND created_at LIKE ?", view[:url], referrer[:url], "#{date}%").count
    			assert number_of_visits_for_referrer == referrer[:visits]
    		end	
    	end
    }
  end
end
