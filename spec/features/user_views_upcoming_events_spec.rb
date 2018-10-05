RSpec.feature "user views details for the next event" do
  scenario "successfully" do
    stub_request_to_meetup_api

    visit root_path

    within("[data-role='upcoming-event']") do
      expect(page).to have_content("Fake Project Night")
      expect(page).to have_content("thoughtbot")
      expect(page).to have_content("41 Winter Street, 6th Floor")
      expect(page).to have_content("Boston")
      expect(page).to have_content("6:00PM to 8:00PM")
    end
  end

  def stub_request_to_meetup_api
    stub_request(:get, /api.meetup.com/).
      to_return(status: 200, body: events_json)
  end

  def events_json
    File.read(Rails.root.join("spec/fixtures/meetup_events.json"))
  end
end
