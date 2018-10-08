class EventParser
  def initialize(data)
    @data = data.with_indifferent_access
  end

  def parse
    Event.new(
      address: venue[:address_1],
      city: venue[:city],
      ends_at: ends_at_utc,
      group_name: group[:urlname],
      name: data[:name],
      starts_at: starts_at_utc,
      state: venue[:state],
      url: data[:link],
      venue_name: venue[:name],
    )
  end

  private
  attr_reader :data

  def group
    data.fetch(:group)
  end

  def venue
    data.fetch(:venue)
  end

  def starts_at_utc
    start_timestamp = data[:time]
    Time.at(start_timestamp/1000).utc.to_datetime
  end

  def ends_at_utc
    if duration.present?
      num_of_hours = duration_in_hours(duration).hours
      starts_at_utc + num_of_hours
    end
  end

  def duration
    data[:duration]
  end

  def duration_in_hours(duration)
    duration/1000/60/60
  end
end
