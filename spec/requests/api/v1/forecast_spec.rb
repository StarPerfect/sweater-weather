require 'rails_helper'

describe 'Forecast API Endpoint' do
  it 'sends forecast data for given location' do

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    parsed_data = JSON.parse(response.body, symbolize_names: true)

    expect(response.content_type).to eq('application/json')
    expect(parsed_data.class).to eq(Hash)
    expect(parsed_data[:data][:attributes].count).to eq(3)
    expect(parsed_data[:data][:attributes].keys).to eq([:current, :daily, :hourly])
    expect(parsed_data[:data][:attributes][:daily].count).to eq(5)
    expect(parsed_data[:data][:attributes][:hourly].count).to eq(8)
  end
end
