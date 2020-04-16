class NewsController < ApplicationController

  def index
    FeedWorker.perform_async
    @entries = Entry.all.order(published: :desc).limit(8000)
  end

  def show
    @entry = Entry.find
  end

end
