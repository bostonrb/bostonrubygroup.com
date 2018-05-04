RSpec.describe EventService do
  describe "#next_event" do
    it "returns the next event for the given meetup group" do
      group_name = "my-awesome-group"
      meetup_events = build_events_for(group_name)
      fake_meetup_api = FakeMeetupApi.new(events: meetup_events)

      event = EventService.next_event(
        group_name: "my-awesome-group",
        data_source: fake_meetup_api
      )

      expect(event).to be_found

      event_name = JSON.parse(meetup_events_json).first["name"]
      expect(event.name).to eq(event_name)
    end

    context "when a future event is not found" do
      it "returns an unknown event" do
        fake_meetup_api = FakeMeetupApi.new(events: [])

        event = EventService.next_event(
          group_name: "group-with-zero-upcoming-events",
          data_source: fake_meetup_api
        )

        expect(event).not_to be_found
        expect(event).to be_an_instance_of(UnknownMeetupEvent)
      end
    end

    context "when the response fails" do
      it "returns an unknown event" do
        meetup_group_name = "invalid-meetup-group"
        fake_meetup_api = FakeMeetupApi.new(events: [], success: false)

        event = EventService.next_event(
          group_name: meetup_group_name,
          data_source: fake_meetup_api
        )

        expect(event).not_to be_found
        expect(event).to be_an_instance_of(UnknownMeetupEvent)
      end
    end
  end

  def build_events_for(group_name)
    JSON.parse(meetup_events_json).map do |event|
      event.deep_merge("group" => { "urlname" => group_name })
    end
  end

  def meetup_events_json
    File.read(Rails.root.join("spec/fixtures/meetup_events.json"))
  end
end
