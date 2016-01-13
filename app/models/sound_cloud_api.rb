class SoundCloudApi
  attr_reader :track_url

  def initialize(tag)
    @client = SoundCloud.new(client_id: ENV['SOUNDCLOUD_ID'])
    @tag = tag

    first_track_url_by_tag
  end

private

  def first_track_url_by_tag
    # tags is the key soundcloud uses to search by tag. it is a comma-separted
    # string list.
    @track_url = @client.get('/tracks', limit: 1, tags: @tag)[0].permalink_url
  end
end
