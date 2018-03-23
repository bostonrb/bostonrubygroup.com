class MeetupClient
  URL = 'https://api.meetup.com/bostonrb/events?&sign=true&photo-host=public&page=1'

  def get
    @event = HTTParty.get(URL).parsed_response
  end
end
