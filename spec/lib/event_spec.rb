require "spec_helper"
require "meetup/event"

RSpec.describe Meetup::Event do
  describe "#venue_name" do
    it "returns the venue name" do
      event = Meetup::Event.new("venue" => { "name" => "thoughtbot" })
      expect(event.venue_name).to eq("thoughtbot")
    end
  end

  describe "#address_1" do
    it "returns address line 1" do
      event = Meetup::Event.new("venue" => { "address_1" => "41 Winter St" })
      expect(event.address_1).to eq("41 Winter St")
    end
  end

  describe "#address_2" do
    it "returns address line 2" do
      event = Meetup::Event.new("venue" => { "address_2" => "Floor 6" })
      expect(event.address_2).to eq("Floor 6")
    end
  end

  describe "#city" do
    it "returns the city" do
      event = Meetup::Event.new("venue" => { "city" => "Boston" })
      expect(event.city).to eq("Boston")
    end
  end

  describe "#state" do
    it "returns the state" do
      event = Meetup::Event.new("venue" => { "state" => "MA" })
      expect(event.state).to eq("MA")
    end
  end
end
