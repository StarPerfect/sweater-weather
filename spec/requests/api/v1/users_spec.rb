require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "POST /users" do
    it 'a post request can create a user and sent back an api key' do
      post '/api/v1/users'

      expect(response).to be_successful

      parsed_data = JSON.parse(response.body, symbolize_names: true)

      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(201)
    end
  end
end
