RSpec.describe MeetupEvent do
  describe "#name" do
    it "returns the name of the event" do
      meetup_event_data = {"name" => "Awesome Event"}

      event = MeetupEvent.new(meetup_event_data)

      expect(event.name).to eq("Awesome Event")
    end
  end

  describe "#date" do
    it "returns the date formatted as month day, year" do
      meetup_event_data = {"local_date" => "2018-05-08"}

      event = MeetupEvent.new(meetup_event_data)

      expect(event.date).to eq("May 08, 2018")
    end
  end

  describe "#formatted_start_time" do
    it "returns the start time formatted with AM/PM" do
      meetup_event_data = {"local_time" => "18:00"}

      event = MeetupEvent.new(meetup_event_data)

      expect(event.formatted_start_time).to eq("6:00PM")
    end

    it "returns a message when the start time is unknown" do
      meetup_event_data = {"local_time" => nil}

      event = MeetupEvent.new(meetup_event_data)

      expect(event.formatted_start_time).to eq("Start Time is TBD")
    end
  end

  describe "#formatted_end_time" do
    it "returns the end time formatted with AM/PM" do
      meetup_event_data = {
        "local_time" => "18:00",
        "duration" => 7200000
      }

      event = MeetupEvent.new(meetup_event_data)

      expect(event.formatted_end_time).to eq("8:00PM")
    end

    it "returns a message when the end time is unknown" do
      meetup_event_data = {"duration" => nil}

      event = MeetupEvent.new(meetup_event_data)

      expect(event.formatted_end_time).to eq("End Time is TBD")
    end
  end

  describe "#venue_name" do
    it "returns the name of the venue" do
      meetup_event_data = {"venue" => {"name" => "thoughtbot"}}

      event = MeetupEvent.new(meetup_event_data)

      expect(event.venue_name).to eq("thoughtbot")
    end
  end

  describe "#address" do
    it "returns the venue address" do
      meetup_event_data = {"venue" => {"address_1" => "41 Winter Street"}}

      event = MeetupEvent.new(meetup_event_data)

      expect(event.address).to eq("41 Winter Street")
    end
  end

  describe "#city" do
    it "returns the venue city" do
      meetup_event_data = {"venue" => {"city" => "Boston"}}

      event = MeetupEvent.new(meetup_event_data)

      expect(event.city).to eq("Boston")
    end
  end

  describe "#rsvp_url" do
    it "returns the event URL for the meetup group" do
      meetup_event_url = "https://www.meetup.com/abc/events/123"
      meetup_event_data = {"link" => meetup_event_url}

      event = MeetupEvent.new(meetup_event_data)

      expect(event.rsvp_url).to eq(meetup_event_url)
    end
  end

  describe "#events_url" do
    it "returns the events URL for the meetup group" do
      group_name = "bostonrb"
      meetup_event_data = {"group" => {"urlname" => group_name}}

      event = MeetupEvent.new(meetup_event_data)

      expect(event.events_url).to eq("https://www.meetup.com/bostonrb/events")
    end
  end
end
