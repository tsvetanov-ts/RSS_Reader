require 'rails_helper'
require_relative '../../app/models/feed'

RSpec.describe FetchFeedsJob, type: :job do
  it 'performs fetch feed job' do
    FetchFeedsJob.perform_now
    assert(!Feed.first.content.nil?)
  end
end
