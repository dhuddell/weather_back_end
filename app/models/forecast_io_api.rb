require 'httparty'
require 'json'

class ForecastIoApi
  include HTTParty

  def initialize(profile)
    @@url = "https://api.forecast.io/forecast/"
    @key = ENV['FORECASTIO_TOKEN']
    @latitude = profile.latitude
    @longitude = profile.longitude

    @response = get_forecast
    @forecast = parse_forecast
  end

  def current_weather
    @forecast[:currently][:icon]
  end

private

  def get_forecast
    HTTParty.get("#{@@url}#{@key}#{@latitude},#{@longitude}").body
  end

  def parse_forecast
    JSON.parse @response, symbolize_names: true
  end
end
