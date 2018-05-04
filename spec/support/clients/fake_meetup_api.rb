class FakeMeetupApi
  def initialize(events:, success: true)
    @events = events
    @success = success
  end

  def upcoming_events(meetup_group_name)
    HttpResponse.new(
      body: filter_events(meetup_group_name).to_json,
      success: success
    )
  end

  private

  attr_reader :events, :success

  def filter_events(meetup_group_name)
    events.select do |event|
      event.dig("group", "urlname") == meetup_group_name
    end
  end
end
