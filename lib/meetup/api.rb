require "httparty"
require "meetup/event"

module Meetup
  class API
    BASE_URI = "https://api.meetup.com"

    def events(url_name)
      body = HTTParty.get("#{BASE_URI}/#{url_name}/events")
      body.map { |_, event_data| Event.new(event_data) }
    end
  end
end
