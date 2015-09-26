require 'typhoeus'
require 'json'

module Darksky
  class API
    DARKSKY_API_URL = 'https://api.forecast.io'

    DEFAULT_OPTIONS = { }

    attr_reader :api_key

    # Create a new instance of the Darksky::API using your API key.
    #
    # @param api_key [String] Dark Sky API key.
    def initialize(api_key)
      @api_key = api_key
    end

    # Returns a forecast for the next hour at a given location.
    #
    # @param latitude [String] Latitude in decimal degrees.
    # @param longitude [String] Longitude in decimal degrees.
    # @param time [Integer] Time expressed in Epoch time (seconds since midnight GMT on Jan 1, 1970).
    # @param option [Hash] (Optional) Options to be passed to the Typhoeus::Request
    def forecast(latitude, longitude, time = nil, options = {})
      time      ||= Time.now.to_i
      url_string  = url latitude, longitude, time
      response    = Typhoeus::Request.get url_string, DEFAULT_OPTIONS.dup.merge(options)
      JSON.parse(response.body) if response.code == 200
    end

    private

      def url(latitude, longitude, time)
        Array.new.tap do |list|
          list << DARKSKY_API_URL
          list << 'forecast'
          list << api_key
          list << [latitude, longitude, time].join(',')
        end.join('/')
      end
  end
end
