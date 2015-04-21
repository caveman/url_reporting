class ReportController < ApplicationController
  #The end-user should be able to access a REST endpoint in your application in order to 
  #retrieve the number of page views per URL, grouped by day, for the past 5 days.
  def top_urls		
  	@top_urls_in_past_5_days = View.top_urls_in_past_days(5)
  	render json: @top_urls_in_past_5_days
  end

  #Your end-users should be able to retrieve the top 5 referrers for the 
  # top 10 URLs grouped by day, for the past 5 days, via a REST endpoint.
  def top_referrers
  	@top_referrers_in_past_5_days = View.top_referrers_in_past_days(5)
  	render json: @top_referrers_in_past_5_days
  end
end