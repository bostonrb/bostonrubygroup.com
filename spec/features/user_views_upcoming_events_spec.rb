RSpec.feature "user views details for the next event" do
  scenario "successfully" do
    stub_request_to_meetup_api

    visit root_path

    within("[data-role='upcoming-event']") do
      expect(page).to have_content("Fake Project Night")
      expect(page).to have_content("thoughtbot")
      expect(page).to have_content("41 Winter Street, 6th Floor")
      expect(page).to have_content("Boston")
    end
  end

  def stub_request_to_meetup_api
    stub_request(:get, /api.meetup.com/).
      to_return(status: 200, body: [future_meetup_event].to_json )
  end

  def future_meetup_event
    future_time_ms = 2.days.from_now.to_i * 1000
    event_data.merge("time" => future_time_ms)
  end

  def event_data
    JSON.parse(file_fixture("meetup_event.json").read)
  end
end
