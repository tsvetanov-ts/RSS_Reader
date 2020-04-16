require 'httparty'
require 'feedjira'

class FeedWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(*args)
    feeds = Feed.all


    feeds.each do |feed|
      response = HTTParty.get(feed.url)
      feed.content = response.body
      feed.save
      begin
        content = Feedjira::Parser::RSS.parse feed.content
      rescue NoParserAvailable
        next
      end
      content.entries.each do |entry|
        local_entry = feed.entries.where(title: entry.title).first_or_initialize
        local_entry.update(content: entry.content, author: entry.author, url: entry.url, published: entry.published)
         p "WORKER Synced Entry - #{entry.title}"
      end
      p "WORKER Synced Feed - #{feed.name}"
    end
  end
end



