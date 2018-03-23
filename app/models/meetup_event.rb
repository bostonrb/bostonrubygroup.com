class MeetupEvent

  def initialize(client)
    @client = client
    @data = @client.get.first
  end

  def link
    @data.dig("link")
  end

  def venue
    @data.dig("venue", "name")
  end

  def city_state
    [@data.dig("venue", "city"), @data.dig("venue", "state")].join(", ")
  end

  def address
    @data.dig("venue", "address_1")
  end

  def start_time
    event_time.strftime("%l:%M %p").strip
  end

  def date
    event_time.strftime("%B %d, %Y")
  end

  private

  def event_time
    time_in_seconds = @data.dig("time") / 1000
    Time.zone.at(time_in_seconds).in_time_zone('Eastern Time (US & Canada)')
  end
end
