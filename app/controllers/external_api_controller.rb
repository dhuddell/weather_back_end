class ExternalApiController < OpenReadController
  def track
    profile = current_user.profile

    current_pairs = profile.weather_pairs.find_by(weather: profile.short_weather)
    track_url = SoundCloudApi.new(current_pairs.genre).track_url

    render json: { track: track_url }
  end
end
