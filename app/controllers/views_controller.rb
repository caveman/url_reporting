class ViewsController < ApplicationController
  def index
    @views = View.where(:created_at=> 5.days.ago..Time.now).order(Sequel.desc(:created_at)).limit(20).all
    respond_to do |format|
      format.html 
      format.json { render json: @views }
    end
  end
end
