class HomesController < ApplicationController
  def show
    @upcoming_event = EventService.next_event(group_name: "bostonrb")
  end
end
