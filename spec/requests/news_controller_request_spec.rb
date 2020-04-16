require 'rails_helper'

RSpec.describe "NewsControllers", type: :request do
  describe 'simple get request' do
    it 'loads news index' do
      get root_url + '/news'
      expect(response).to be_successful
    end
  end

end
