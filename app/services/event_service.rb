class EventService
  def self.next_event(group_name:, data_source: MeetupApi.new)
    new(group_name, data_source).next_event
  end

  def initialize(group_name, data_source)
    @group_name = group_name
    @data_source = data_source
  end

  def next_event
    response = data_source.upcoming_events(group_name)

    if upcoming_events_found?(response)
      MeetupEvent.new(response.parsed_body.first)
    else
      UnknownMeetupEvent.new
    end
  end

  private
  attr_reader :group_name, :data_source

  def upcoming_events_found?(response)
    response.success? && response.parsed_body.present?
  end
end
