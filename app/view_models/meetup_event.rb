class MeetupEvent
  def initialize(data)
    @data = ActiveSupport::HashWithIndifferentAccess.new(data)
  end

  def found?
    true
  end

  def name
    data[:name]
  end

  def date
    date = data[:local_date]

    if date.present?
      date.to_date.to_s(:long)
    end
  end

  def formatted_start_time
    if start_time.present?
      start_time.to_s(:time_with_am_pm)
    else
      "Start Time is TBD"
    end
  end

  def formatted_end_time
    if end_time.present?
      end_time.to_s(:time_with_am_pm)
    else
      "End Time is TBD"
    end
  end

  def venue_name
    venue[:name]
  end

  def address
    venue[:address_1]
  end

  def city
    venue[:city]
  end

  def state
    venue[:state]
  end

  private
  attr_reader :data

  def start_time
    local_start_time = data[:local_time]

    if local_start_time
      Time.parse(local_start_time)
    end
  end

  def end_time
    if start_time.present? && duration.present?
      num_of_hours = duration_in_hours(duration)
      start_time + num_of_hours.hours
    end
  end

  def duration
    data[:duration]
  end

  def duration_in_hours(duration)
    duration/1000/60/60
  end

  def venue
    data.fetch(:venue)
  end
end
