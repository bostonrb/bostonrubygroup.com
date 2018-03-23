require 'meetup_client'

class HomesController < ApplicationController
  def show
    @client = MeetupClient.new
    @meetup_event = MeetupEvent.new(@client)
  end
end
