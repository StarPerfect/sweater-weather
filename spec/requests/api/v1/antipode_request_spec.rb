require 'rails_helper'

describe 'Antipode Endpoint' do
  it 'determines Antipode city with its weather based upon given location' do
    get '/api/v1/antipode?location=hong kong'

    expect(response).to be_successful

    parsed_data = JSON.parse(response.body, symbolize_names: true)

    expect(response.content_type).to eq('application/json')
    expect(parsed_data.class).to eq(Hash)
    expect(parsed_data[:data].count).to eq(3)
    expect(parsed_data[:data][:attributes][:search_location]).to eq('hong kong')
    expect(parsed_data[:data][:attributes][:type]).to eq('antipode')
  end
end
