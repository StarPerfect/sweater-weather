require 'rails_helper'

RSpec.describe 'RoadTrip', type: :request do
  before :each do
    @user = User.create!(email: "whatever@example.com", password: "password")
  end

  it 'can send info through a post request to obtain roadtrip details' do
    post '/api/v1/road_trip', params: { "origin": "Denver,CO",
                                        "destination": "Pueblo,CO",
                                        "api_key": @user.api_key
                                      }

    expect(response).to be_successful

    parsed_data = JSON.parse(response.body, symbolize_names: true)

    expect(response.content_type).to eq('application/json')
    expect(response).to have_http_status(200)
    expect(parsed_data[:data][:attributes].keys.count).to eq(4)
    expect(parsed_data[:data][:attributes][:origin]).to eq('Denver,CO')
    expect(parsed_data[:data][:attributes][:destination]).to eq('Pueblo,CO')
  end

  it 'no api key returns 404' do
    post '/api/v1/road_trip', params: { "origin": "Denver,CO",
                                        "destination": "Pueblo,CO",
                                      }

    expect(response).to_not be_successful
    expect(response.content_type).to eq('application/json')
    expect(response).to have_http_status(401)
  end

  it 'invalid api key returns 404' do
    post '/api/v1/road_trip', params: { "origin": "Denver,CO",
                                        "destination": "Pueblo,CO",
                                        'api_key': 123
                                      }

    expect(response).to_not be_successful
    expect(response.content_type).to eq('application/json')
    expect(response).to have_http_status(401)
  end
end
