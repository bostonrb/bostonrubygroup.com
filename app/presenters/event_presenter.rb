class EventPresenter < SimpleDelegator
  TIME_ZONE = "America/New_York"

  def date
    starts_at.in_time_zone(TIME_ZONE).to_date.to_s(:long)
  end

  def start_time
    format_local_time(starts_at)
  end

  def end_time
    if ends_at.present?
      format_local_time(ends_at)
    else
      "TBD"
    end
  end

  def events_url
    URI.join(ENV.fetch("MEETUP_URL"), "#{group_name}/events").to_s
  end

  private

  def format_local_time(datetime)
    datetime.in_time_zone(TIME_ZONE).to_s(:time_with_am_pm)
  end
end
