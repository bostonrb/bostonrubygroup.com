require "spec_helper"
require "meetup/api"

RSpec.describe Meetup::API do
  describe "#events" do
    it "returns all events for the given url_name" do
      url = "https://api.meetup.com/bostonrb/events"
      body = { "0" => { "venue" => { "name" => "thoughtbot" } } }
      expect(HTTParty).to receive(:get).with(url).and_return(body)
      events = Meetup::API.new.events("bostonrb")
      expect(events.count).to eq(1)
      expect(events.first.venue_name).to eq("thoughtbot")
    end
  end
end
