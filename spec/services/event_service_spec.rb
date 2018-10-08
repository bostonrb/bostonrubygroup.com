RSpec.describe EventService do
  describe "#upcoming_events" do
    it "returns upcoming events for the given meetup group" do
      group_name = "my-awesome-group"
      meetup_event = build_event(group_name)
      fake_meetup_api = FakeMeetupApi.new(events: [meetup_event])

      events = EventService.upcoming_events(
        group_name: "my-awesome-group",
        data_source: fake_meetup_api
      )

      expect(events.first.name).to eq(meetup_event["name"])
    end

    context "when the request fails" do
      it "returns an empty collection" do
        fake_meetup_api = FakeMeetupApi.new(events: [], success: false)

        events = EventService.upcoming_events(
          group_name: "invalid-group",
          data_source: fake_meetup_api
        )

        expect(events).to be_empty
      end
    end
  end

  def build_event(group_name)
    event_data.deep_merge("group" => { "urlname" => group_name })
  end

  def event_data
    JSON.parse(file_fixture("meetup_event.json").read)
  end
end
