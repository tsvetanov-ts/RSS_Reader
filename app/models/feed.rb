class Feed < ActiveRecord::Base
  validates :url, presence: true
  validates :url, format: { with: URI.regexp }, allow_blank: true
  validates :name, presence: true
  has_many :entries, dependent: :destroy
end
