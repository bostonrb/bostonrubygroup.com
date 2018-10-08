RSpec.describe "homes/_events.html.erb", type: :view do
  context "when the next event is unknown" do
    it "displays a helpful message" do
      assign(:upcoming_event, EventPresenter.new(nil))

      render

      expect(rendered).to have_no_upcoming_event_message
    end
  end

  def have_no_upcoming_event_message
    have_role_text("upcoming-event", "No Upcoming Event")
  end
end
