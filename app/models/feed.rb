class Feed < ActiveRecord::Base
  extend AutoStripAttributes

  auto_strip_attributes :url
  validates :url, presence: true
  validates :url, format: {with: URI::DEFAULT_PARSER.make_regexp}, allow_blank: true
  validates :name, presence: true
  has_many :entries, dependent: :destroy

end
