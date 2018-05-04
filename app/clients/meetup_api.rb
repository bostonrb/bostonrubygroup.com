class MeetupApi
  BASE_URL = "https://api.meetup.com/".freeze

  def upcoming_events(group_name)
    HttpClient.get(events_path(group_name))
  end

  private

  def events_path(group_name)
    build_url("#{group_name}/events")
  end

  def build_url(path)
    URI.join(BASE_URL, path).to_s
  end
end
