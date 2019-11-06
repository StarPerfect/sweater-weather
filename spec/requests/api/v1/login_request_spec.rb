require 'rails_helper'

RSpec.describe 'Login', type: :request do
  describe 'POST /users' do
    before :each do
      user = User.create!(email: "whatever@example.com", password: "password", api_key: "11o11")
    end

    it 'a post request can login the user and sent back an api key' do
      post '/api/v1/sessions', params: { "email": "whatever@example.com",
                                      "password": "password",
                                    }

      expect(response).to be_successful

      parsed_data = JSON.parse(response.body, symbolize_names: true)

      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(200)
      expect(parsed_data[:data][:attributes].keys).to eq([:api_key])
    end

    it 'send error if invalid credentials are sent in post' do
      post '/api/v1/sessions', params: { "email": "whatever@example.com",
                                      "password": "nope",
                                    }

      expect(response).to_not be_successful
      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(401)
    end
  end
end
