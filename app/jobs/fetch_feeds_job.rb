require 'httparty'
require 'feedjira'

class FetchFeedsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    feeds = Feed.all
    feeds.each do |feed|
      response = HTTParty.get(feed.url)
      feed.content = response.body
      feed.save
      content = Feedjira.parse feed.content
      content.entries.each do |entry|
        local_entry = feed.entries.where(title: entry.title).first_or_initialize
        local_entry.update_attributes(content: entry.content, author: entry.author, url: entry.url, published: entry.published)
        p "Synced Entry - #{entry.title}"
      end
      p "Synced Feed - #{feed.name}"
    end
  end
end

FetchFeedsJob.perform_now
