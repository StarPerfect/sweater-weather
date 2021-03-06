require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "POST /users" do
    it 'a post request can create a user and sent back an api key' do
      post '/api/v1/users', params: { "email": "whatever@example.com",
                                      "password": "password",
                                      "password_confirmation": "password"
                                    }

      expect(response).to be_successful

      parsed_data = JSON.parse(response.body, symbolize_names: true)

      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(201)
      expect(parsed_data[:data][:attributes].keys).to eq([:api_key])
    end

    it 'send error if invalid credentials are sent in post' do
      post '/api/v1/users', params: { "email": "whatever@example.com",
                                      "password": "password",
                                      "password_confirmation": "wrong"
                                    }

      expect(response).to_not be_successful
      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(418)
    end
  end
end
