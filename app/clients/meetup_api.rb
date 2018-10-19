class MeetupApi
  BASE_URL = "https://api.meetup.com/".freeze

  def upcoming_events(group_name)
    HttpClient.get(upcoming_events_path(group_name))
  end

  private

  def upcoming_events_path(group_name)
    build_url("#{group_name}/events?has_ended=false")
  end

  def build_url(path)
    URI.join(BASE_URL, path).to_s
  end
end
