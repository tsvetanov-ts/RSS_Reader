class NewsController < ApplicationController

  def index
    @entries = Entry.all.order('published desc')
    FetchFeedsJob.perform_now
  end

  def show
    @entry = Entry.find(params[:id])
  end

end
