require 'rails_helper'

describe 'Backgrounds Image Endpoint' do
  it 'can retrieve a relevant background image for the forcast display' do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful

    parsed_data = JSON.parse(response.body, symbolize_names: true)
    
    expect(response.content_type).to eq('application/json')
    expect(parsed_data.class).to eq(Hash)
    expect(parsed_data.count).to eq(3)
    expect(parsed_data[:id]).to eq(7)
  end
end
