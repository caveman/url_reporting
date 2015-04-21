class View < Sequel::Model
	class << self
		def top_urls_in_past_days(past_days)
			visits_by_date = {}
			views_from_last_n_days = View.where(:created_at=> past_days.days.ago..Time.now).order(Sequel.desc(:created_at)).all 
		  views_from_last_n_days.group_by{ |v| v.created_at.strftime('%Y-%m-%d') }
		  .each{ |date, views_by_date| 
	  		visits_by_date[date] = []
	  		views_by_date.group_by{|view| view.url }
	  		.each{ |url, views_by_date_url|
	  			visits_by_date[date] << { :url => url , :visits => views_by_date_url.size }
	  		}
	  		visits_by_date[date].sort!{ |a,b| b[:visits] <=> a[:visits] } 
	  	}
		  visits_by_date
	  end

	  def top_referrers_in_past_days(past_days)
			visits_by_date_with_referrers = {}
			views_from_past_n_days = View.where(:created_at=> past_days.days.ago..Time.now).order(Sequel.desc(:created_at)).all 
	  	views_from_past_n_days.group_by{ |v| v.created_at.strftime('%Y-%m-%d') }
	  	.each{ |date, views_by_date| 
	  		visits_by_date_with_referrers[date] = []
	  		views_by_date.group_by{|view| view.url }
	  		.each{ |url, views_by_date_url|
	  			referrers = []
	  			views_by_date_url.group_by{ |view| view.referrer }
	  			.each{ |referrer, views_by_date_url_referrer|
	  				referrers << { url: referrer, visits: views_by_date_url_referrer.size }
	  			}
	  			visit_by_date_with_referrers = { :url => url, 
	  																 :visits => views_by_date_url.size,
	  																 :referrers => referrers.sort!{ |a,b| b[:visits] <=> a[:visits] }  }
	  			visits_by_date_with_referrers[date] << visit_by_date_with_referrers	
	  		} 
	  		visits_by_date_with_referrers[date].sort!{ |a,b| b[:visits] <=> a[:visits] } 
	  	}
	  	visits_by_date_with_referrers
	  end
	end
end