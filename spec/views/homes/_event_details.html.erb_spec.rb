RSpec.describe "homes/_event_details.html.erb_spec.rb", type: :view do
  it "renders details about the event" do
    parsed_event = EventParser.new(event_data).parse
    event = EventPresenter.new(parsed_event)

    render("homes/event_details", event: event)

    expect(rendered).to have_event_name(event.name)

    expect(rendered).to have_content(event.date)
    expect(rendered).to have_content(event.start_time)
    expect(rendered).to have_content(event.end_time)
    expect(rendered).to have_content(event.venue_name)
    expect(rendered).to have_content(event.address)
    expect(rendered).to have_content(event.city)

    expect(rendered).to have_link("RSVP", href: event.url)
    expect(rendered).to have_link("See all events", href: event.events_url)
  end

  def have_event_name(name)
    have_role_text("event-name", name)
  end

  def event_data
    JSON.parse(file_fixture("meetup_event.json").read)
  end
end
