RSpec.describe "homes/_events.html.erb", type: :view do
  context "when the next event is unknown" do
    it "display that the upcoming event is unknown" do
      assign(:upcoming_event, UnknownMeetupEvent.new)

      render

      within_role("upcoming-event-details") do
        expect(rendered).to have_text("No Upcoming Event")
      end
    end
  end
end
