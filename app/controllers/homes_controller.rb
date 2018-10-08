class HomesController < ApplicationController
  def show
    @upcoming_event = EventPresenter.new(upcoming_event)
  end

  private

  def upcoming_event
    EventService.upcoming_events(group_name: "bostonrb").first
  end
end
