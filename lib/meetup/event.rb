module Meetup
  class Event
    class InvalidEventDataError < StandardError; end

    def initialize(data)
      @data = data
    end

    def venue_name
      venue.fetch("name", &error_handler)
    end

    def address_1
      @data["venue"]["address_1"]
    end

    def address_2
      @data["venue"]["address_2"]
    end

    def city
      @data["venue"]["city"]
    end

    def state
      @data["venue"]["state"]
    end
  end

  private

  def venue
    @data.fetch("venue", &error_handler)
  end

  def error_handler
    ->(key) { raise InvalidEventDataError.new("No key #{key} found ") }
  end
end
