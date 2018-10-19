RSpec.describe MeetupApi do
  describe ".upcoming_events" do
    it "requests a group's future events from the Meetup API" do
      meetup_group = "ruby-friends"
      http_response = HttpResponse.new(success: true, body: "")

      allow(HttpClient).to receive(:get).and_return(http_response)

      MeetupApi.new.upcoming_events(meetup_group)

      expect(HttpClient)
        .to have_received(:get)
        .with("https://api.meetup.com/#{meetup_group}/events?has_ended=false")
    end
  end
end
