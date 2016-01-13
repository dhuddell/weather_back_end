class Profile < ActiveRecord::Base
  belongs_to :user

  has_many :weather_pairs, dependent: :destroy

  SHORT_WEATHER_LOOKUP = {
    'clear-night' => 'clear',
    'clear-day' => 'clear',
    'rain' => 'raining',
    'snow' => 'snowing',
    'sleet' => 'raining',
    'wind' => 'clear',
    'fog' => 'cloudy',
    'cloudy' => 'cloudy',
    'partly-cloudy-day' => 'cloudy',
    'partly-cloudy-night' => 'cloudy'
  }

  def current_weather
    ForecastIoApi.new(self).current_weather
  end

  def short_weather
    SHORT_WEATHER_LOOKUP[current_weather]
  end

end
