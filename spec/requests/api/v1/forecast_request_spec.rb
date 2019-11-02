require 'rails_helper'

describe 'Forecast API Endpoint' do
  it 'sends forecast data for given location' do

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
  end
end
