# require_relative '../../app/models/meetup_event'
require 'rails_helper'
describe MeetupEvent do

  let(:response_body) do
    [
      {
        "time"    => 1522794600000,
        "updated" => 1521384331000,
        "venue"   =>
          {
            "address_1" => "41 Winter St, 6th Floor",
            "name"      => "thoughtbot",
            "city"      => "Boston",
            "state"     => "MA"
          },
        "group"   => {},
        "link"    => "https://www.meetup.com/bostonrb/events/248861644/",
      }
    ]
  end

  let(:meetup_client) {
    double("client", get: response_body)
  }


  describe 'an instance' do
    let(:meetup_event) { MeetupEvent.new(meetup_client) }

    it 'reports the link of the' do
      expect(meetup_event.link).to eq("https://www.meetup.com/bostonrb/events/248861644/")
    end

    it 'reports the name' do
      expect(meetup_event.venue).to eq('thoughtbot')
    end

    it 'reports city and state' do
      expect(meetup_event.city_state).to eq("Boston, MA")
    end

    it 'reports the address of the event' do
      expect(meetup_event.address).to eq("41 Winter St, 6th Floor")
    end

    it "reports the start time of the event" do
      expect(meetup_event.start_time).to eq("6:30 PM")
    end

    it 'reports the date of the event' do
      expect(meetup_event.date).to eq("April 03, 2018")
    end
  end
end
