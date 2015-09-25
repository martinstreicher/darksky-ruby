require 'spec_helper'

describe Darksky::API do
  let(:darksky_api) { Darksky::API.new('your_api_key') }

  describe '#forecast' do
    specify 'should return a valid forecast for a latitude and longitude' do
      VCR.use_cassette('forecast', :record => :once) do
        Timecop.freeze(Time.at(1443199409)) do
          forecast = darksky_api.forecast '42.7243', '-73.6927'

          expect(forecast['currently']['summary']).to eq('Mostly Cloudy')
          expect(forecast['flags']['units']).to eq('us')
        end
      end
    end

    specify 'should return a valid forecast for a latitude, longitude, and time' do
      VCR.use_cassette('forecast_with_time', :record => :once) do
        now      = 1443199368
        forecast = darksky_api.forecast '42.7243', '-73.6927', now

        expect(forecast['currently']['time']).to eq(now)
      end
    end
  end
end
