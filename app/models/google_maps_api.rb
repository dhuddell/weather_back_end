require 'httparty'
require 'json'

class GoogleMapsApi
  include HTTParty

  def initialize(profile)
    @@url = "http://maps.googleapis.com/maps/api/geocode/json?address="
    @zip_code = profile.zip_code

    @result = get_location
    @location = parse_location

    profile.latitude, profile.longitude = latitude, longitude
  end

private
  def get_location
    HTTParty.get("#{@@url}#{@zip_code}").body
  end

  def parse_location
    JSON.parse @result, symbolize_names: true
  end

  def latitude
    @location[:results][0][:geometry][:location][:lat]
  end

  def longitude
    @location[:results][0][:geometry][:location][:lng]
  end

end
