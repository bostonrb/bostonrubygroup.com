RSpec.describe EventPresenter do
  describe "#date" do
    it "returns the date formatted as month-day-year" do
      time = Time.parse("2018-10-01T20:00:00Z")
      event = Event.new(starts_at: time)

      result = EventPresenter.new(event).date

      expect(result).to eq("October 01, 2018")
    end
  end

  describe "#start_time" do
    it "returns the start time in America/New_York, formatted with AM/PM" do
      time = Time.parse("2018-10-01T22:00:00Z")
      event = Event.new(starts_at: time)

      result = EventPresenter.new(event).start_time

      expect(result).to eq("6:00PM")
    end
  end

  describe "#end_time" do
    it "returns the end time in America/New_York, formatted with AM/PM" do
      time = Time.parse("2018-10-01T24:00:00Z")
      event = Event.new(ends_at: time)

      result = EventPresenter.new(event).end_time

      expect(result).to eq("8:00PM")
    end

    it "returns a message when the end time is unknown" do
      event = Event.new(ends_at: nil)

      result = EventPresenter.new(event).end_time
      expect(result).to eq("TBD")
    end
  end

  describe "#events_url" do
    it "returns the events URL for the meetup group" do
      event = Event.new(group_name: "bakers")

      result = EventPresenter.new(event).events_url

      expect(result).to eq("https://www.meetup.com/bakers/events")
    end
  end

  def build_event(event_data)
    EventParser.new(event_data).parse
  end

  def event_data
    JSON.parse(file_fixture("meetup_event.json").read)
  end
end
