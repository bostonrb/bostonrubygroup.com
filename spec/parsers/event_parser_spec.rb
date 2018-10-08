RSpec.describe "EventParser" do
  describe "#parse" do
    it "maps the event data to an Event" do
      event = EventParser.new(event_data).parse

      expect(event.name).to eq(event_data["name"])
      expect(event.address).to eq(event_data["venue"]["address_1"])
      expect(event.city).to eq(event_data["venue"]["city"])
      expect(event.state).to eq(event_data["venue"]["state"])
      expect(event.venue_name).to eq(event_data["venue"]["name"])
      expect(event.url).to eq(event_data["link"])
      expect(event.group_name).to eq(event_data["group"]["urlname"])
    end

    it "sets the start time" do
      timestamp_in_milliseconds = 1.day.ago.to_i * 1000

      event_with_start_time = event_data.merge(
        "time" => timestamp_in_milliseconds
      )

      event = EventParser.new(event_with_start_time).parse

      expected_time = Time.at(timestamp_in_milliseconds/1000)
      expect(event.starts_at).to eq(expected_time)
    end

    it "sets the end time" do
      duration = 2.hours
      duration_ms = duration.to_i * 1000
      timestamp_ms = 1.day.ago.to_i * 1000

      event_with_end = event_data.merge(
        "time" => timestamp_ms,
        "duration" => duration_ms
      )

      event = EventParser.new(event_with_end).parse

      expected_time = Time.at(timestamp_ms/1000 + duration_ms/1000)
      expect(event.ends_at).to eq(expected_time)
    end

    context "when the duration is missing" do
      it "returns nil" do
        event_missing_duration = event_data.merge(
          "local_time" => "18:00",
          "duration" => nil
        )

        event = EventParser.new(event_missing_duration).parse

        expect(event.ends_at).to be_nil
      end
    end
  end

  def event_data
    JSON.parse(file_fixture("meetup_event.json").read)
  end
end
